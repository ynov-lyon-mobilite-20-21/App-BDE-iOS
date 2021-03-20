//
//  OnBoardingAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class OnBoardingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(OnBoardingViewModel.self) { _ -> OnBoardingViewModel in
            return OnBoardingViewModel()
        }

        container.register(OnBoardingView.self) { r -> OnBoardingView in
            let viewModel = r.resolve(OnBoardingViewModel.self)!

            return OnBoardingView(viewModel: viewModel)
        }
    }
}
