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
        container.register(ProfileViewModel.self) { _ -> ProfileViewModel in
            return ProfileViewModel()
        }

        container.register(ProfileView.self) { r -> ProfileView in
            let viewModel = r.resolve(ProfileViewModel.self)!

            return ProfileView(viewModel: viewModel)
        }
    }
}
