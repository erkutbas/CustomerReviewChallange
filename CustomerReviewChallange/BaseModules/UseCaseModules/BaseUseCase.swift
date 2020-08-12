//
//  BaseUseCase.swift
//  BitaksiClient
//
//  Created by Erkut Baş on 9.03.2020.
//  Copyright © 2020 Bitaksi. All rights reserved.
//

import Foundation
import RxSwift

class BaseUseCase<P, T>: BaseUseCaseInterface {
    
    private let disposeBag = DisposeBag()
    
    typealias Parameters = P
    typealias Responses = T
    
    func generateUseCase(parameter: P) -> T? {
        return nil
    }
    
    func addDisposable(disposable: Disposable?) {
        guard disposable != nil else {
            return
        }
        disposeBag.insert(disposable!)
        print("diposeBag count : \(disposeBag)")

    }
    
    deinit {
        print("DEINIT BaseUseCase")
    }
}
