//
//  DataModel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class DataModel<T: CodableDataProtocol>: BaseResponseProtocol {
    
    var returnCode: Int?
    var returnMessage: String?
    
    let data: T?
    
    init(data: T?) {
        self.data = data
    }
    
}
