//
//  ReviewService.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class ReviewApiService {
    
    func getReviewData(request: ReviewRequest) -> ReviewServiceModel {
        return ReviewServiceModel(request: request)
    }
    
    deinit {
        print("DEINIT AuthApiService")
    }
    
}
