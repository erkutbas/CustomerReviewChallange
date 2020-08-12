//
//  HeaderFields.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

enum HTTPHeaderFields: GenericDescriptorProtocol {
    typealias Value = String
    
    case authorization
    case contentType
    case acceptType
    case acceptEncoding
    case requestName
    case userAgent
    
    var value: String {
        switch self {
        case .authorization:
            return "Authorization"
        case .contentType:
            return "Content-Type"
        case .acceptType:
            return "Accept"
        case .acceptEncoding:
            return "Accept-Encoding"
        case .requestName:
            return "RequestName"
        case .userAgent:
            return "User-Agent"
        }
    }

}
