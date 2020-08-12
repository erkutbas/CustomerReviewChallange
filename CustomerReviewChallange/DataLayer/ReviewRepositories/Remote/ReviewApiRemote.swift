//
//  ReviewApiRemote.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class ReviewApiRemote: ReviewApiRemoteInterface {

    private let apiManager: HttpClientInterface
    private let reviewApiService: ReviewApiService
    
    init(apiManager: HttpClientInterface, reviewApiService: ReviewApiService) {
        self.apiManager = apiManager
        self.reviewApiService = reviewApiService
    }
    
    func getReviewRemote(request: ReviewRequest) -> Single<ReviewData> {
        return apiManager.executeRequest(urlRequestConvertible: reviewApiService.getReviewData(request: request))
    }
    
}
