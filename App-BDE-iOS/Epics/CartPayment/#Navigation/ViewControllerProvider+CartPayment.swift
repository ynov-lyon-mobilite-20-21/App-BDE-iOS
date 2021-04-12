//
//  ViewControllerProvider+CartPaymentAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func cartPayment(event: Event) -> CartPaymentView {
        let assembler = generateAssembler(viewControllerAssembly: CartPaymentAssembly())

        return assembler.resolver.resolve(CartPaymentView.self, argument: event)!
    }
}
