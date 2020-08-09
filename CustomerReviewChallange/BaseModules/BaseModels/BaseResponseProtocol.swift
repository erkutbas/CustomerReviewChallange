//
//  BaseResponseProtocol.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

protocol BaseResponseProtocol: CodableDataProtocol {
    var returnCode: Int? { get }
    var returnMessage: String? { get }
}
