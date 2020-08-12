//
//  ReviewServiceModel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class ReviewServiceModel: ApiServiceProvider<ReviewRequest> {
    
    init(request: ReviewRequest) {
        super.init(method: .get, path: ConstantEndpoints.Paths.customerReviews.path, isAuthRequested: false, data: request)
    }
    
    deinit {
        print("DEINIT ReviewServiceModel")
    }
    
}
