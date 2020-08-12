//
//  FeedSliderComponentDelegate.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

protocol FeedSliderComponentDelegate: AnyObject {
    func getItem(index: Int) -> GenericDataProtocol?
    func getNumberOfItem() -> Int
    func refreshData()
    
}
