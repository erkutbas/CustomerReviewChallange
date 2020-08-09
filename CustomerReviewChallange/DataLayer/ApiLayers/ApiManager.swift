//
//  ApiManager.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class ApiManager: HttpClientInterface {
    
    // MARK: - To manage Alamofire requests -
    private var session = Session()

    // MARK: - To decode JSON response -
    private var jsonDecoder = JSONDecoder()
    
    init(interceptor: ApiInterceptor, eventMonitors: ApiEventMonitor) {

        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 60
        configuration.requestCachePolicy = .reloadIgnoringCacheData

        session = Session(configuration: configuration, startRequestsImmediately: true, interceptor: interceptor, eventMonitors: [eventMonitors])

    }
    
    func executeRequest<R>(urlRequestConvertible: URLRequestConvertible) -> PrimitiveSequence<SingleTrait, R> where R: CodableDataProtocol {
        
        print("APIMANAGER EXECUTED")
        
        return Single.create { [weak self] (single) -> Disposable in
            
            self?.session.request(urlRequestConvertible).validate().response(completionHandler: { (alamofireResponseData) in
                self?.responseParser(alamofireResponseData: alamofireResponseData, single: single)
            })
            
            return Disposables.create()
        }
    }
    
    func responseParser<R>(alamofireResponseData: AFDataResponse<Data?>, single: (SingleEvent<R>) -> Void) where R: CodableDataProtocol {
        
        print("responseParser executed")
        
        switch alamofireResponseData.result {
        case .failure(let error):

            if let data = alamofireResponseData.data {
                do {
                    // server side returns logical business error message
                    let dataDecoded = try jsonDecoder.decode(ServerResponse.self, from: data)
                    single(.error(ErrorResponse(serverResponse: dataDecoded, apiConnectionErrorType: .serverError(self.returnStatusCode(data: alamofireResponseData)))))
                } catch _ {
                    // unacceptable status codes, data can not be decoded such as internal server errors 500 etc...
                    single(.error(ErrorResponse(apiConnectionErrorType: .missingData(self.returnStatusCode(data: alamofireResponseData)))))
                }
            } else {
                // In the circumstances the client can not reach server side, there is no data can be decoded. For instance time out cases.
                single(.error(ErrorResponse(apiConnectionErrorType: .connectionError(self.returnErrorCode(error: error)))))
            }
        case .success(let data):
            if let data = data {
                do {
                    let dataDecoded = try jsonDecoder.decode(R.self, from: data)
                    single(.success(dataDecoded))
                } catch let error {
                    single(.error(ErrorResponse(apiConnectionErrorType: .dataDecodedFailed(error.localizedDescription))))
                }
            }
        }
    }
    
    private func returnStatusCode(data: AFDataResponse<Data?>) -> Int {
        guard let response = data.response else { return 0 }
        return response.statusCode
    }

    private func returnErrorCode(error: AFError) -> Int {
        guard let underlyingError = error.underlyingError else { return NSURLErrorUnknown }
        return underlyingError._code
    }

}
