//
//  ReviewUsecase.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class ReviewUsecase: SingleUseCase<ReviewRequest, ReviewData> {
    
    private let repository: ReviewRepositoryInterface
    
    init(repository: ReviewRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: ReviewRequest) -> Single<ReviewData>? {
        return repository.getReviewData(request: parameter)
    }
    
    deinit {
        print("DEINIT LoginUseCase")
    }
}
