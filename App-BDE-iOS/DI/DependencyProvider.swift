//
//  DependencyProvider.swift
//  FYD
//
//  Created by Maxence on 29/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Swinject

class DependencyProvider {
    private let container: Container
    private let assembler: Assembler
    
    static let shared = DependencyProvider()

    init() {
        container = Container()
        assembler = Assembler([HelperAssembly()], container: container)
        
        container.register(DependencyProvider.self) { _ in
            return self
        }
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return self.container.resolve(serviceType)
    }

    func resolve<Service, Argument>(_ serviceType: Service.Type, argument: Argument) -> Service? {
        return self.container.resolve(serviceType, argument: argument)
    }
}
