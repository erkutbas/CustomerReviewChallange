//
//  ServerResponse.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class ServerResponse: Codable, Error {
    let returnMessage: String?
    let returnCode: Int?

    init(returnMessage: String? = nil, returnCode: Int? = nil) {
        self.returnMessage = returnMessage
        self.returnCode = returnCode
    }
}
