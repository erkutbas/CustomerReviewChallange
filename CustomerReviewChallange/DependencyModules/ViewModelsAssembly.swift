//
//  ViewModelsAssembly.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ViewModelsAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(AppViewModel.self, initializer: AppViewModel.init).inObjectScope(.container)
        container.autoregister(MainViewModel.self, initializer: MainViewModel.init).inObjectScope(.weak)
        container.autoregister(SplashScreenViewModel.self, initializer: SplashScreenViewModel.init).inObjectScope(.weak)
        container.autoregister(TutorialViewModel.self, initializer: TutorialViewModel.init).inObjectScope(.weak)
    }
}
