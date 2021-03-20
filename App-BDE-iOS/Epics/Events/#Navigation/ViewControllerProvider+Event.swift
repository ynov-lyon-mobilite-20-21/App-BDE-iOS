//
//  ViewControllerProvider+Event.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func event() -> EventView {
        let assembler = generateAssembler(viewControllerAssembly: EventAssembly())

        return assembler.resolver.resolve(EventView.self)!
    }
}
