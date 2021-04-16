//
//  CheckoutPaymentAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 14/04/2021.
//

import Foundation

import Swinject
import SwinjectAutoregistration

final class CheckoutPaymentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CheckoutPaymentViewModel.self) { (r: Resolver, event: Event) -> CheckoutPaymentViewModel in
            let viewModel = CheckoutPaymentViewModel()
            viewModel.setup(event: event)
            viewModel.getCreditsCardsWebService = r.resolve(GetCreditsCardsWebService.self)
            viewModel.stripePaymentWebService = r.resolve(StripePaymentWebService.self)
            viewModel.registerStripeNewCreditCard = r.resolve(RegisterStripeNewCreditCard.self)
            viewModel.createNewStripeCreditCardWebService = r.resolve(CreateNewStripeCreditCardWebService.self)
            return viewModel
        }

        container.register(CheckoutPaymentView.self) { (r: Resolver, event: Event) -> CheckoutPaymentView in
            let viewModel = r.resolve(CheckoutPaymentViewModel.self, argument: event)!

            return CheckoutPaymentView(viewModel: viewModel)
        }
    }
}
