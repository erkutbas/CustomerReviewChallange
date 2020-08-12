//
//  ConstantEndpoints.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

struct ConstantEndpoints {
    
    // MARK: - BaseUrls according to environments -
    struct BaseUrls {
        static let developmentBaseEndpointUrl = "https://itunes.apple.com/"
        static let testBaseEndpointUrl = "https://itunes.apple.com/"
        static let qualityAssuranceBaseEndpointUrl = "https://itunes.apple.com/"
    }
    
    // MARK: - Paths ... -
    enum Paths {
        case customerReviews
        
        /*
         
         other paths....
         
         */
        
        // MARK: - Endpoint Paths -
        var path: String {
            switch self {
            // MARK: - Authentication Endpoints -
            case .customerReviews:
                return "nl/rss/customerreviews/id=474495017/sortby=mostrecent/json"
            }
        }
    }
    
}
