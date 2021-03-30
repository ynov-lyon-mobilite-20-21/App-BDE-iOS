//
//  ViewControllerProvider+Profil.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func profile() -> ProfileView {
        let assembler = generateAssembler(viewControllerAssembly: ProfileAssembly())
        return assembler.resolver.resolve(ProfileView.self)!
    }
}
