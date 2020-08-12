//
//  LabelAlignmentData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class LabelAlignmentData {
    
    private(set) var numberOfLines: Int
    private(set) var lineBreakMode: NSLineBreakMode
    
    init(numberOfLines: Int = 0, lineBreakMode: NSLineBreakMode = .byWordWrapping) {
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
    }
    
}
