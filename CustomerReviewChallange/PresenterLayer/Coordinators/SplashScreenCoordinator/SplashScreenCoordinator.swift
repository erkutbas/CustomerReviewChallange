//
//  SplashScreenCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SplashScreenCoordinator: BaseCoordinator<SplashScreenViewModel> {
    
    private let disposeBag = DisposeBag()
    
    private var splashFinalize = BehaviorRelay<Bool>(value: false)
    
    lazy var splashProcessCompletion: OnCompletedBool = { [weak self] completed in
        if completed {
            self?.splashFinalize.accept(true)
            self?.dismissSplashCoordinator()
        }
    }
    
    override func start() {
        let viewController = SplashScreenViewController(viewModel: viewModel)
        self.viewContoller = viewController
        subscribeSplashProcess()
    }
    
    private func subscribeSplashProcess() {
        viewModel.subscribeSplashProcess(completion: splashProcessCompletion).disposed(by: disposeBag)
    }
    
    private func dismissSplashCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    func listenSplahCoordinatorFinishes(completion: @escaping OnCompletedBool) -> Disposable {
        return splashFinalize.subscribe(onNext: completion)
    }
    
}
