//
//  ViewControllerProvider+CartPaymentAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func cardRegistration(event: Event, onCardRegistered: @escaping () -> Void) -> CardRegistrationView {
        let assembler = generateAssembler(viewControllerAssembly: CardRegistrationAssembly())

        return assembler.resolver.resolve(CardRegistrationView.self, arguments: event, onCardRegistered)!
    }
}
