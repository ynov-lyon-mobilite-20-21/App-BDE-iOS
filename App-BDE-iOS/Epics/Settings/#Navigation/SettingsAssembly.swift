//
//  SettingsAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/02/2021.
//

import Swinject
import SwinjectAutoregistration

final class SettingsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SettingsViewModel.self) { r -> SettingsViewModel in
            return SettingsViewModel()
        }
        
        container.register(SettingsView.self) { r -> SettingsView in
            let viewModel = r.resolve(SettingsViewModel.self)!
            
            return SettingsView(viewModel: viewModel)
        }
    }
}
