//
//  CoordinatorsAssembly.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class CoordinatorsAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init).inObjectScope(.container)
        container.autoregister(MainCoordinator.self, initializer: MainCoordinator.init).inObjectScope(.container)
    }
}
