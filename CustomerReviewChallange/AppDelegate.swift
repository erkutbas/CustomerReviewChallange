//
//  AppDelegate.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        startAppCoordinator()
        
        return true
    }

    private func startAppCoordinator() {
        guard let appCoordinator = Assembler.sharedAssembler.resolver.resolve(AppCoordinator.self) else { return }
        appCoordinator.start()
    }


}

