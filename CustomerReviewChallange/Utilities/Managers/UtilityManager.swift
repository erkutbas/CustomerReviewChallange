//
//  UtilityManager.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class UtilityManager {
    
    /// Description: Returns BaseUrl for endpoint calls
    /// - Parameter environment: Environments such as test, development, etc...
    class func returnBaseUrl(environment: Environments = .development) -> String {
        return BaseEndPoints(environment: environment).returnBaseUrl()
    }
    
}
