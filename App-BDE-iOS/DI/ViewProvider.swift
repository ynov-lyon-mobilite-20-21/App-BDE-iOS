//
//  ViewProvider.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

class ViewProvider {
    static func generateAssembler(viewControllerAssembly: Assembly) -> Assembler {
        return Assembler([viewControllerAssembly, HelperAssembly()])
    }
}
