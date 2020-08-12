//
//  UseCaseAssembly.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

import Foundation
import Swinject
import SwinjectAutoregistration

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ReviewUsecase.self, initializer: ReviewUsecase.init).inObjectScope(.weak)
    }
}
