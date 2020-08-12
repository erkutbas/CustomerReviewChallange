//
//  ApiAdapter.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//


import Alamofire

class ApiAdapter: RequestAdapter {

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        // at this part of the code, we add access token into http request header to manage interceptor layer in networking
        completion(.success(urlRequest))
    }

}

