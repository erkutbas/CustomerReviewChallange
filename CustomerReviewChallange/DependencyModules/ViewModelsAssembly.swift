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
        container.autoregister(FeedViewModel.self, initializer: FeedViewModel.init).inObjectScope(.weak)
    }
}
