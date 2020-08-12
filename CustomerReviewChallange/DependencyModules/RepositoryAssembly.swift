//
//  RepositoryAssembly.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ReviewRepositoryInterface.self, initializer: ReviewRepository.init).inObjectScope(.weak)
        container.autoregister(ReviewApiRemoteInterface.self, initializer: ReviewApiRemote.init).inObjectScope(.weak)
        container.autoregister(ReviewApiService.self, initializer: ReviewApiService.init).inObjectScope(.weak)
    }
}
