//
//  SignInAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 25/02/2021.
//

import Swinject
import SwinjectAutoregistration

final class SignInAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SignInViewModel.self) { r -> SignInViewModel in
            let viewModel = SignInViewModel()
            viewModel.loginWebService = r.resolve(LoginWebService.self)
            return viewModel
        }
        
        container.register(SignInView.self) { r -> SignInView in
            let viewModel = r.resolve(SignInViewModel.self)!
            
            return SignInView(viewModel: viewModel)
        }
    }
}
