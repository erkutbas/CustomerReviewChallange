//
//  Endpoints.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class BaseEndPoints {
    
    private var baseUrl: String!
    
    private init() { }
    
    init(environment: Environments) {
        switch environment {
        case .development:
            baseUrl = ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl
        case .test:
            baseUrl = ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl
        case .qualityAssurance:
            baseUrl = ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl
        }
    }
    
    func returnBaseUrl() -> String {
        return baseUrl
    }
    
}
