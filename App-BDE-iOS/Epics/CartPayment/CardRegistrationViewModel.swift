//
//  CartPaymentViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation
import Stripe
import SwiftUI

class CardRegistrationViewModel: BaseViewModel {
    
    func setup(event: Event, onCardRegistered: @escaping () -> Void) {
        self.event = event
        self.onCardRegistered = onCardRegistered
    }
    var event: Event!
    var onCardRegistered: (() -> Void)!
    var registerStripeNewCreditCard: RegisterStripeNewCreditCard!
    var createNewStripeCreditCardWebService: CreateNewStripeCreditCardWebService!
    
    var number: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var exp_month: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var exp_year: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var cvc: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var owner: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    func createStripeCreditCardOnStripeServer(onCardCreated: @escaping () -> Void) {
        let registerStripeNewCreditCardParameters = RegisterStripeNewCreditCardParameters(number: number,
                                                                                          exp_month: exp_month,
                                                                                          exp_year: exp_year,
                                                                                          cvc: cvc,
                                                                                          name: owner)
        
        let serviceParameters = ExecuteServiceSetup(service: registerStripeNewCreditCard,
                                                    parameters: registerStripeNewCreditCardParameters)
        executeRequestWithURLEncoded(serviceParameters, onSuccess: { value in
            self.createStripeCreditCardOnServer(with: value.id, onCardCreated: onCardCreated)
        }, onError: { error in
            print("VOILA L'ERREUR \(error)")
        })
    }
    
    private func createStripeCreditCardOnServer(with stripeIdCard: String, onCardCreated: @escaping () -> Void) {
        let stripeIDServiceParameters = StripeIDServiceParameters(stripeId: stripeIdCard)
        let serviceParameters = ExecuteServiceSetup(service: createNewStripeCreditCardWebService, parameters: stripeIDServiceParameters, isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            onCardCreated()
            self.onCardRegistered()
        }, onError: { error in
            print(error)
        })
    }
    
}
