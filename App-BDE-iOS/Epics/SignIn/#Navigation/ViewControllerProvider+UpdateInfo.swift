//
//  ViewControllerProvider+SignIn.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func UpdateInfo() -> UpdateInfoView {
        let assembler = generateAssembler(viewControllerAssembly: UpdateInfoAssembly())

        return assembler.resolver.resolve(UpdateInfoView.self)!
    }
}
