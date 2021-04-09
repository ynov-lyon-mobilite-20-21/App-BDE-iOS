//
//  SignInAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class UpdateInfoAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UpdateInfoViewModel.self) { r -> UpdateInfoViewModel in
            let viewModel = UpdateInfoViewModel()
            viewModel.updateUserWebService = r.resolve(UpdateUserWebService.self)
            return viewModel
        }

        container.register(UpdateInfoView.self) { r -> UpdateInfoView in
            let viewModel = r.resolve(UpdateInfoViewModel.self)!

            return UpdateInfoView(viewModel: viewModel)
        }
    }
}
