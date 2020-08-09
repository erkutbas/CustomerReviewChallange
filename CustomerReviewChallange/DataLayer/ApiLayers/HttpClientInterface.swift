//
//  HttpClientInterface.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol HttpClientInterface {
    func executeRequest<R: CodableDataProtocol>(urlRequestConvertible: URLRequestConvertible) -> Single<R>
    func responseParser<R: CodableDataProtocol>(alamofireResponseData: AFDataResponse<Data?>, single: Single<R>.SingleObserver)
}
