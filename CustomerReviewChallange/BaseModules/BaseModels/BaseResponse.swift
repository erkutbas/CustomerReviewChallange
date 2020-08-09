//
//  BaseResponse.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

public class BaseResponse: BaseResponseProtocol {
    var returnCode: Int?
    var returnMessage: String?

    public init(returnCode: Int?, returnMessage: String?) {
        self.returnCode = returnCode
        self.returnMessage = returnMessage
    }
}
