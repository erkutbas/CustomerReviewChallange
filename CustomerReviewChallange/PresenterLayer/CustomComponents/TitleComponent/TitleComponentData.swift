//
//  TitleComponentData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class TitleComponentData {
    private(set) var title: String?
    private(set) var subTitle: String?
    private(set) var titleFont: UIFont?
    private(set) var subtitleFont: UIFont?
    private(set) var subTitleAlignmentData: LabelAlignmentData
    
    init(title: String?, subTitle: String?, titleFont: UIFont? = nil, subtitleFont: UIFont? = nil, subTitleAlignmentData: LabelAlignmentData = LabelAlignmentData()) {
        self.title = title
        self.subTitle = subTitle
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.subTitleAlignmentData = subTitleAlignmentData
    }
}
