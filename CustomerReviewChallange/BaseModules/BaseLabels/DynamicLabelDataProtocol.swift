//
//  DynamicLabelDataProtocol.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

protocol DynamicLabelDataProtocol {
    var version: String { get }
}

extension DynamicLabelDataProtocol {
    func returnVersion() -> String {
        return version
    }
}
