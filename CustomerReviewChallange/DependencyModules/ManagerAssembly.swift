//
//  ManagerAssembly.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 8.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NetworkConnectionManager.self, initializer: NetworkConnectionManager.init)
        container.autoregister(TutorialManager.self, initializer: TutorialManager.init)
    }
}
