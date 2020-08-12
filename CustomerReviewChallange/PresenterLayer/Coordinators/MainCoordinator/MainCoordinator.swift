//
//  MainCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class MainCoordinator: BaseCoordinator<MainViewModel> {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        
        let mainViewController = MainViewController(viewModel: viewModel)
        navigationController.viewControllers = [mainViewController]
        
        subscribeForFurtherCoordinators()
        
    }
    
    private func subscribeForFurtherCoordinators() {
        viewModel.listenForDetailFlow { [weak self] (data) in
            self?.goToDetailCoordinator(data: data)
        }.disposed(by: disposeBag)
    }
    
    private func goToDetailCoordinator(data: FeedComponentViewData) {
        let coordinator = FeedDetailCoordinator(viewModel: FeedDetailViewModel(data: data))
        start(coordinator: coordinator)
        
        self.navigationController.pushViewController(coordinator.viewContoller, animated: true)
    }
    
    deinit {
        print("DEINIT MainCoordinator")
    }
    
}
