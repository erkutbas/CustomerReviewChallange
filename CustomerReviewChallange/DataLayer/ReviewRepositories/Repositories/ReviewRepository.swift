//
//  ReviewRepository.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class ReviewRepository: ReviewRepositoryInterface {
    
    private let reviewApiRemote: ReviewApiRemoteInterface!
    
    init(reviewApiRemote: ReviewApiRemoteInterface) {
        self.reviewApiRemote = reviewApiRemote
    }
    
    func getReviewData(request: ReviewRequest) -> Single<ReviewData> {
        return reviewApiRemote.getReviewRemote(request: request)
    }
    
    deinit {
        print("DEINIT ReviewRepository")
    }

}
