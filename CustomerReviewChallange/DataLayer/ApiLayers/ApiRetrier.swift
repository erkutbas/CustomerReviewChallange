//
//  ApiRetrier.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//


import Foundation
import Alamofire

class ApiRetrier: RequestRetrier {

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {

        guard let task = request.task, let response = task.response as? HTTPURLResponse else {
            completion(.doNotRetry)
            return
        }
        
        completion(.doNotRetry)

        switch response.statusCode {
        case 403:
            // direct the application login screen
            print("token refresh is required")
            //completion(.retry)
        default:
            completion(.doNotRetry)

        }
        
    }

}
