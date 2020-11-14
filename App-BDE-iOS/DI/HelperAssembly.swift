//
//  HelperAssembly.swift
//  FYD
//
//  Created by Maxence on 29/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import UIKit

class HelperAssembly: Assembly {
    func assemble(container: Container) {
        //  Foundation
        container.autoregister(JSONDecoder.self, initializer: JSONDecoder.init)
        container.autoregister(JSONEncoder.self, initializer: JSONEncoder.init)
        
        //  Views
        container.autoregister(SignUpViewModel.self, initializer: SignUpViewModel.init)
        container.register(SignUpView.self) { _ in SignUpView() }
        
        //  API
        container.autoregister(AuthenticationRequests.self, initializer: AuthenticationRequests.init)
        container.autoregister(SignUpRequests.self, initializer: SignUpRequests.init)
    }
}
