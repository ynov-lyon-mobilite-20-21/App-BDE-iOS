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
            let viewModel = SettingsViewModel()
            viewModel.deleteUserWebService = r.resolve(DeleteUserWebService.self)
            viewModel.userRepository = r.resolve(UserRepository.self)
            return viewModel
        }

        container.register(SettingsView.self) { r -> SettingsView in
            let viewModel = r.resolve(SettingsViewModel.self)!

            return SettingsView(viewModel: viewModel)
        }
    }
}
