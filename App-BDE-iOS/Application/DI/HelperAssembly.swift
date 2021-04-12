//
//  HelperAssembly.swift
//  FYD
//
//  Created by Maxence on 29/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import UIKit

class HelperAssembly: Assembly {
    func assemble(container: Container) {
        //  Foundation
        container.autoregister(JSONDecoder.self, initializer: JSONDecoder.init)
        container.autoregister(JSONEncoder.self, initializer: JSONEncoder.init)

        //  Service
        container.autoregister(KeyChainService.self, initializer: KeyChainService.init)
        container.autoregister(LoginWebService.self, initializer: LoginWebService.init)
        container.autoregister(SignUpWebService.self, initializer: SignUpWebService.init)
        container.autoregister(QRScannerWebService.self, initializer: QRScannerWebService.init)
        container.autoregister(GetUserWebService.self, initializer: GetUserWebService.init)
        container.autoregister(DeleteUserWebService.self, initializer: DeleteUserWebService.init)
        container.autoregister(UpdateUserWebService.self, initializer: UpdateUserWebService.init)
        container.autoregister(GetEventWebService.self, initializer: GetEventWebService.init)
        container.autoregister(StripePaymentWebService.self, initializer: StripePaymentWebService.init)
        container.autoregister(GetCreditsCardsWebService.self, initializer: GetCreditsCardsWebService.init)
        container.autoregister(RegisterStripeNewCreditCard.self, initializer: RegisterStripeNewCreditCard.init)
        container.autoregister(CreateNewStripeCreditCardWebService.self, initializer: CreateNewStripeCreditCardWebService.init)
    }
}
