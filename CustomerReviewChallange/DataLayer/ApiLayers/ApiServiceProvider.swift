//
//  ApiServiceProvider.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Alamofire

class ApiServiceProvider<T: CodableDataProtocol>: URLRequestConvertible {
    
    private var method: HTTPMethod
    private var path: String?
    //private var isBody: Bool
    private var isAuthRequested: Bool
    private var data: T?
    
    /// Description: General Api call service provider. It's create a urlRequestConvertible object to pass as an argument to alamofire url session request
    /// - Parameters:
    ///   - method: http methods, default value is get
    ///   - path: url path, default value is nil
    ///   - isAuthRequested: it's used to pass accessToken to header or not. Default value is true
    ///   - data: Codable data. If request is post, patch or put it's used as body otherwise as query string
    init(method: HTTPMethod = .get, path: String? = nil, isAuthRequested: Bool = true, data: T? = nil) {
        self.method = method
        self.path = path
        self.isAuthRequested = isAuthRequested
        //self.isBody = isBody
        self.data = data
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try UtilityManager.returnBaseUrl(environment: .development).asURL()
        
        if let path = path {
            url = url.appendingPathComponent(path)
        }
         
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        request.cachePolicy = .reloadIgnoringCacheData
        
        return try encoding.encode(request, with: params)
        
    }
    
    // MARK: - Encoding -
    private var encoding: ParameterEncoding {
        switch method {
        case .post, .patch, .put:
            return JSONEncoding.default
        default:
            return URLEncoding.queryString
        }
    }
    
    private var params: Parameters? {
        return data.asDictionary()
    }

    private var headers: HTTPHeaders {
        var httpHeaders = HTTPHeaders()
        httpHeaders.add(HTTPHeader(name: HTTPHeaderFields.contentType.value, value: "application/json; charset=utf-8"))

        return httpHeaders
    }
    
}
