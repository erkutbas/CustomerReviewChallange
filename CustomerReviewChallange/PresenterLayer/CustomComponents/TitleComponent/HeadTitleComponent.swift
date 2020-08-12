//
//  HeadTitleComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class HeadTitleComponent: TitleComponent {
    
    override func loadDataToView() {
        super.loadDataToView()

        titleLabel.font = SourceSansPro.Black(20).value
        subtitleLabel.font = SourceSansPro.Light(12).value
        
    }
    
}
