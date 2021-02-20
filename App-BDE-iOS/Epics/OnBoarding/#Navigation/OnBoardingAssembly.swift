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
        container.register(OnBoardingViewModel.self) { r -> OnBoardingViewModel in
            return OnBoardingViewModel()
        }
        
        container.register(onBoardingView.self) { r -> onBoardingView in
            let viewModel = r.resolve(OnBoardingViewModel.self)!
            
            return onBoardingView(viewModel: viewModel)
        }
    }
}
