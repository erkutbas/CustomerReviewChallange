//
//  FeedDetailCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit
import RxSwift

class FeedDetailCoordinator: BaseCoordinator<FeedDetailViewModel> {

    private let disposeBag = DisposeBag()
    
    override func start() {
        let viewController = FeedDetailViewController(viewModel: viewModel)
        self.viewContoller = viewController
        
        subscribeOnDismiss()
    }
    
    private func subscribeOnDismiss() {
        viewModel.subscribeCloseFeedDetailObservable { [weak self] in
            self?.killFeedDetailCoordinator()
        }.disposed(by: disposeBag)
    }
    
    private func killFeedDetailCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
    
    deinit {
        print("DEINIT \(FeedDetailCoordinator.identifier)")
    }
    
}
