//
//  CartPaymentAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Swinject
import SwinjectAutoregistration

final class CardRegistrationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CardRegistrationViewModel.self) { (r: Resolver, event: Event, onCardRegistered: @escaping () -> Void) -> CardRegistrationViewModel in
            let viewModel = CardRegistrationViewModel()
            viewModel.setup(event: event, onCardRegistered: onCardRegistered)
            viewModel.registerStripeNewCreditCard = r.resolve(RegisterStripeNewCreditCard.self)
            viewModel.createNewStripeCreditCardWebService = r.resolve(CreateNewStripeCreditCardWebService.self)

            return viewModel
        }

        container.register(CardRegistrationView.self) { (r: Resolver, event: Event, onCardRegistered: @escaping () -> Void) -> CardRegistrationView in
            let viewModel = r.resolve(CardRegistrationViewModel.self, arguments: event, onCardRegistered)!

            return CardRegistrationView(viewModel: viewModel)
        }
    }
}
