//
//  StarRatingViewData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class StarRatingViewData {
    private(set) var starCount: Int = 0
    private(set) var starSpacing: CGFloat = 0.0
    private(set) var imageSize: CGSize = CGSize(width: 10, height: 10)
    private(set) var filledImage: String
    private(set) var emptyImage: String

    init(starCount: Int = 0, starSpacing: CGFloat = 0.0, imageSize: CGSize = CGSize(width: 10, height: 10), filledImage: String, emptyImage: String) {
        self.starCount = starCount
        self.starSpacing = starSpacing
        self.imageSize = imageSize
        self.filledImage = filledImage
        self.emptyImage = emptyImage
    }
}
