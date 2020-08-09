//
//  LocalizableConstants.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

public enum LocalizableString {
    
    public enum LabelPrompts: GenericDescriptorProtocol {
        case sample

        typealias Value = String
        
        var value: String {
            switch self {
            case .sample:
                return "sample".toLocalize()
            }
        }
    }
    
}
