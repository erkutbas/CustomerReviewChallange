//
//  TutorialCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 8.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TutorialCoordinator: BaseCoordinator<TutorialViewModel> {
    
    private let disposeBag = DisposeBag()
    
    private var tutorialFinalize = BehaviorRelay<Bool>(value: false)
    
    override func start() {
        guard let viewController = TutorialViewController.instantiate() else { return }
        viewController.viewModel = viewModel
        self.viewContoller = viewController
        
        subscribeOnDismiss()
        
    }
    
    private func subscribeOnDismiss() {
        viewModel.subscribeActionButtonForNextAction { [weak self] in
            self?.fireTutorialFinalize()
        }.disposed(by: disposeBag)
    }
    
    private func dismissForParent() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    private func fireTutorialFinalize() {
        dismissForParent()
        tutorialFinalize.accept(true)
    }
    
    func listenTutorialCoordinatorFinishes(completion: @escaping OnCompletedBool) -> Disposable {
        return tutorialFinalize.subscribe(onNext: completion)
    }
    
}
