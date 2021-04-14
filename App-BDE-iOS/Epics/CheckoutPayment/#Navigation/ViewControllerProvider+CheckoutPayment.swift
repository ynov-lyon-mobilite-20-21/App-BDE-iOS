//
//  ViewControllerProvider+CheckoutPayment.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 14/04/2021.
//

import Foundation

extension ViewProvider {
    static func checkoutPayment(event: Event) -> CheckoutPaymentView {
        let assembler = generateAssembler(viewControllerAssembly: CheckoutPaymentAssembly())
        return assembler.resolver.resolve(CheckoutPaymentView.self, argument: event)!
    }
}
