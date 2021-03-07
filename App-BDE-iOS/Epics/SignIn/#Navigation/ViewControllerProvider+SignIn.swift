//
//  ViewControllerProvider+SignIn.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 25/02/2021.
//


import Foundation
import Swinject

extension ViewProvider {
    static func signIn() -> SignInView {
        let assembler = generateAssembler(viewControllerAssembly: SignInAssembly())
        
        return assembler.resolver.resolve(SignInView.self)!
    }
}
