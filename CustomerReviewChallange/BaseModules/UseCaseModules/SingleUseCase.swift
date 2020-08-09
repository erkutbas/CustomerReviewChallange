//
//  SingleUseCase.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class SingleUseCase<Params, T>: BaseUseCase<Params, Single<T>> {
    
    func execute(useCaseCallBack: UseCaseCallBack<T>, params: Params) {
        addDisposable(disposable: self.generateUseCase(parameter: params)?.subscribe(onSuccess: { (response) in
            useCaseCallBack.onSuccess(response: response)
        }, onError: { [weak self](error) in
            self?.onErrorCondition(useCaseCallBack: useCaseCallBack, error: error)
        }))
    }
    
    private func onErrorCondition(useCaseCallBack: UseCaseCallBack<T>, error: Error) {
        guard let error = error as? ErrorResponse else { return }
        useCaseCallBack.onError(error: error)
    }
    
    deinit {
        print("DEINIT SingleUseCase")
    }
    
}
