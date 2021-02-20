//
//  ViewControllerProvider+SignUp.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func signUp() -> SignUpView {
        let assembler = generateAssembler(viewControllerAssembly: SignUpAssembly())
        
        return assembler.resolver.resolve(SignUpView.self)!
    }
}
