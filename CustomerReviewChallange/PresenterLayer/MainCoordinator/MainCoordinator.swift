//
//  MainCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

class MainCoordinator: BaseCoordinator<MainViewModel> {
    
    override func start() {
        
        let mainViewController = MainViewController(viewModel: viewModel)
        navigationController.viewControllers = [mainViewController]
        
    }
    
    deinit {
        print("DEINIT MainCoordinator")
    }
    
}
