//
//  ViewControllerTypeProtocol.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

protocol ViewControllerTypeProtocol {
    var viewTitle: String? { get }
}

extension ViewControllerTypeProtocol {
    func returnValue() -> String? {
        return viewTitle
    }
}
