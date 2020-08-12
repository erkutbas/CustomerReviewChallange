//
//  FeedComponentCell.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FeedComponentCell: GenericTableViewCell<GenericDataProtocol, FeedComponentView> {
    
    override func setupView() {
        super.setupView()
        
        selectionStyle = .none
    }
    
}
