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
        container.register(UpdateInfoViewModel.self) { _ -> UpdateInfoViewModel in
            return UpdateInfoViewModel()
        }

        container.register(UpdateInfoView.self) { r -> UpdateInfoView in
            let viewModel = r.resolve(UpdateInfoViewModel.self)!

            return UpdateInfoView(viewModel: viewModel)
        }
    }
}
