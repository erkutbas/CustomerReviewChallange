//
//  ApiInterceptor.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//


import Foundation
import Alamofire

class ApiInterceptor: Interceptor {

    override init(adapter: RequestAdapter, retrier: RequestRetrier) {
        super.init(adapter: adapter, retrier: retrier)
    }

}
