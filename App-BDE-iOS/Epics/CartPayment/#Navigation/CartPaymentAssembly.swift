//
//  CartPaymentAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Swinject
import SwinjectAutoregistration

final class CartPaymentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CartPaymentViewModel.self) { (r: Resolver, event: Event) -> CartPaymentViewModel in
            let viewModel = CartPaymentViewModel()
            viewModel.setup(event: event)
            viewModel.stripePaymentWebService = r.resolve(StripePaymentWebService.self)
            viewModel.getCreditsCardsWebService = r.resolve(GetCreditsCardsWebService.self)
            viewModel.registerStripeNewCreditCard = r.resolve(RegisterStripeNewCreditCard.self)
            viewModel.createNewStripeCreditCardWebService = r.resolve(CreateNewStripeCreditCardWebService.self)
            return viewModel
        }

        container.register(CartPaymentView.self) { (r: Resolver, event: Event) -> CartPaymentView in
            let viewModel = r.resolve(CartPaymentViewModel.self, argument: event)!

            return CartPaymentView(viewModel: viewModel)
        }
    }
}
