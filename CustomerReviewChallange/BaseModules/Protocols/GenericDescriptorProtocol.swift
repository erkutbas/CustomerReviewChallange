//
//  GenericDescriptorProtocol.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

protocol GenericDescriptorProtocol {
    
    associatedtype Value
    var value: Value { get }
}
