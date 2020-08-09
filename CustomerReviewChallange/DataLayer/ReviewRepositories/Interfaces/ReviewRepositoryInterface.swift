//
//  ReviewRepositoryInterface.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 10.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

protocol ReviewRepositoryInterface {
    
    func getReviewData(request: ReviewRequest) -> Single<ReviewReponse> 
    
}
