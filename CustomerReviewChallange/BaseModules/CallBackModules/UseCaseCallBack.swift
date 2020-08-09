//
//  UseCaseCallBack.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class UseCaseCallBack<T>: UseCaseCallBackInteractor {
    typealias Response = T
    
    var onSuccessCompletion: ((T) -> Void)?
    var onErrorCompletion: ((ErrorResponse) -> Void)?
    var onCallBackResultCompletion: ((Result<T, ErrorResponse>) -> Void)?

    func onSuccess(response: T) {
        onSuccessCompletion?(response)
        onCallBackResultCompletion?(.success(response))
    }
    
    func onError(error: ErrorResponse) {
        onErrorCompletion?(error)
        onCallBackResultCompletion?(.failure(error))
    }
    
    func onSuccess(completion: @escaping (T) -> Void) {
        onSuccessCompletion = completion
    }
    
    func onError(completion: @escaping (ErrorResponse) -> Void) {
        onErrorCompletion = completion
    }
    
    func commonResult(completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        onCallBackResultCompletion = completion
    }
    
}
