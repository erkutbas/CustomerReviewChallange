//
//  ReviewUsecase.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class ReviewUsecase: SingleUseCase<ReviewRequest, ReviewReponse> {
    
    private let repository: AuthApiRepositoryInteractor
    
    init(repository: AuthApiRepositoryInteractor) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: LoginRequest) -> Single<ProfileResponse>? {
        return repository.login(request: parameter)
    }
    
    deinit {
        print("DEINIT LoginUseCase")
    }
}
