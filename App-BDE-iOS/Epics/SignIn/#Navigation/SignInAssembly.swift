//
//  SignInAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class SignInAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SignInViewModel.self) { r -> SignInViewModel in
            return SignInViewModel()
        }
        
        container.register(SignInView.self) { r -> SignInView in
            let viewModel = r.resolve(SignInViewModel.self)!
            
            return SignInView(viewModel: viewModel)
        }
    }
}
