//
//  SplashScreenViewModel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class SplashScreenViewModel: BaseViewModelDelegate {

    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    /// Description: This module could be used to get app configuration files,
    /// app initialize process or application session management etc
    func startSplashProcess() {
        // to do
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.fireSplashProcessFinish()
        }
    }
    
    func subscribeSplashProcess(completion: @escaping OnCompletedBool) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
    func fireSplashProcessFinish() {
        splashFinalize.accept(true)
    }
    
    func dismissCoordinator() {
        
    }
    
    deinit {
        print("DEINIT SplashScreenViewModel")
    }
    
}
