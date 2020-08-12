//
//  TailTitleComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//


import UIKit

class TailTitleComponent: TitleComponent {
    
    override func loadDataToView() {
        super.loadDataToView()
        
        titleLabel.font = SourceSansPro.Bold(16).value
        subtitleLabel.font = SourceSansPro.Regular(14).value

        subtitleLabel.lineBreakMode = .byTruncatingTail
        subtitleLabel.numberOfLines = 3
    }

}
