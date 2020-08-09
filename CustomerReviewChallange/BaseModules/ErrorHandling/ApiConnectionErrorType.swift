//
//  ApiConnectionErrorType.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

enum ApiConnectionErrorType {
    case missingData(Int)
    case connectionError(Int)
    case serverError(Int)
    case dataDecodedFailed(String)
}
