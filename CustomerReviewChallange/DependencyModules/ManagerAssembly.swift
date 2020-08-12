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
import Alamofire

class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NetworkConnectionManager.self, initializer: NetworkConnectionManager.init)
        container.autoregister(TutorialManager.self, initializer: TutorialManager.init)
        container.autoregister(RequestRetrier.self, initializer: ApiRetrier.init).inObjectScope(.container)
        container.autoregister(RequestAdapter.self, initializer: ApiAdapter.init).inObjectScope(.container)
        container.autoregister(ApiInterceptor.self, initializer: ApiInterceptor.init).inObjectScope(.container)
        container.autoregister(ApiEventMonitor.self, initializer: ApiEventMonitor.init).inObjectScope(.container)
        container.autoregister(HttpClientInterface.self, initializer: ApiManager.init).inObjectScope(.container)
    }
}
