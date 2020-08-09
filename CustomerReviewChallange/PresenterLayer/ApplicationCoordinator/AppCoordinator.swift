//
//  AppCoordinator.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift
import Swinject

class AppCoordinator: BaseCoordinator<AppViewModel> {
    
    private let disposeBag = DisposeBag()
    private let networkConnectionManager: NetworkConnectionManager
    private let tutorialManager: TutorialManager
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    //var window: UIWindow?
    
    init(networkConnectionManager: NetworkConnectionManager, tutorialManager: TutorialManager, appViewModel: AppViewModel) {
        self.networkConnectionManager = networkConnectionManager
        self.tutorialManager = tutorialManager
        
        super.init(viewModel: appViewModel)
        
    }

    private lazy var finishSplashProcess: OnCompletedBool = { [weak self] completed in
        if completed {
            self?.launchApplication()
        }
    }
    
    override func start() {
        window.makeKeyAndVisible()
        loadSplashScreen()
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
    
    // MARK: - Main Screens Implementations -
    private func launchMainProcess() {
        removeChildCoordinators()
        
        guard let coordinator = AssemblerResolver.resolve(MainCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.navigationController, withAnimation: true)
        
    }
    
    // MARK: - Tutorial Screens Implementations -
    private func launchTutorialProcess() {
        UserDefaultsGenericStructStore.hasLaunchBefore = .launched
        
        guard let coordinator = AssemblerResolver.resolve(TutorialCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.navigationController, withAnimation: true)
        
    }
    
    // MARK: - Splash Screen Implemententations -
    private func loadSplashScreen() {
        removeChildCoordinators()
        guard let coordinator = AssemblerResolver.resolve(SplashScreenCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        coordinator.listenSplahCoordinatorFinishes(completion: finishSplashProcess).disposed(by: disposeBag)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    private func registerTutorialObservers() {
        
    }
    
    deinit {
        print("DEINIT \(AppCoordinator.identifier)")
    }
    
}
