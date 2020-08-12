//
//  FeedComponentViewData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class FeedComponentViewData: GenericDataProtocol {
    private(set) var titleComponentData: TitleComponentData
    private(set) var titleComponentDetailData: TitleComponentData
    private(set) var rating: Int
    
    init(titleComponentData: TitleComponentData, titleComponentDetailData: TitleComponentData, rating: Int) {
        self.titleComponentData = titleComponentData
        self.titleComponentDetailData = titleComponentDetailData
        self.rating = rating
    }
    
}
