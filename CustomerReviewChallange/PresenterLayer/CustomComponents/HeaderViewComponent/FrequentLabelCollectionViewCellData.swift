//
//  FrequentLabelCollectionViewCellData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class FrequentLabelCollectionViewCellData: GenericCellTypeProtocol {
    var viewType: ViewType {
        return .info
    }
    
    private(set) var text: String
    private(set) var occuring: Int
    
    init(text: String, occuring: Int) {
        self.text = text
        self.occuring = occuring
    }
}
