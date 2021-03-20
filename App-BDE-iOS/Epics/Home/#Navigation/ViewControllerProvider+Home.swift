//
//  ViewControllerProvider+Home.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func home() -> HomeView {
        let assembler = generateAssembler(viewControllerAssembly: HomeAssembly())

        return assembler.resolver.resolve(HomeView.self)!
    }
}
