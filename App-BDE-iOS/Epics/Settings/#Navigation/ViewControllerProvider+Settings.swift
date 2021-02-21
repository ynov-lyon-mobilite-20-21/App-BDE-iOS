//
//  ViewControllerProvider+Settings.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/02/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func settings() -> SettingsView {
        let assembler = generateAssembler(viewControllerAssembly: SettingsAssembly())
        
        return assembler.resolver.resolve(SettingsView.self)!
    }
}
