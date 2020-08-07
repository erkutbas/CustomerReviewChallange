//
//  AppCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class AppCoordinator: BaseCoordinator<AppViewModel> {
    
    private let disposeBag = DisposeBag()
    private let networkConnectionManager: NetworkConnectionManager
    private let tutorialManager: TutorialManager
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    init(networkConnectionManager: NetworkConnectionManager, tutorialManager: TutorialManager, appViewModel: AppViewModel) {
        self.networkConnectionManager = networkConnectionManager
        self.tutorialManager = tutorialManager
        
        super.init(viewModel: appViewModel)
        
    }
    
    override func start() {
        window.makeKeyAndVisible()
        
        launchApplication()
    }
    
    private func launchApplication() {
        
        switch UserDefaultsGenericStructStore.hasLaunchBefore {
        case .launched:
            /*
             We do not have a authentication flow, login, register etc for this assignment.
             if we do, a session manager can decide either go to login, register or to main screens
             */
            launchMainProcess()
        case .notLaunched:
            launchTutorialProcess()
        }
    }
    
    
    private func launchMainProcess() {
        removeChildCoordinators()
        
    }
    
    // MARK: - Tutorial Screens Implementations -
    private func launchTutorialProcess() {
        UserDefaultsGenericStructStore.hasLaunchBefore = .launched
        
    }
    
    private func registerTutorialObservers() {
        
    }
    
    deinit {
        print("DEINIT \(AppCoordinator.identifier)")
    }
    
}
