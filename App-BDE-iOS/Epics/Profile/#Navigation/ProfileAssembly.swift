//
//  ProfilAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class ProfileAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProfileViewModel.self) { r -> ProfileViewModel in
            let viewModel = ProfileViewModel()
            viewModel.getUserWebService = r.resolve(GetUserWebService.self)
            viewModel.userRepository = r.resolve(UserRepository.self)
            return viewModel
        }

        container.register(ProfileView.self) { r -> ProfileView in
            let viewModel = r.resolve(ProfileViewModel.self)!

            return ProfileView(viewModel: viewModel)
        }
    }
}
