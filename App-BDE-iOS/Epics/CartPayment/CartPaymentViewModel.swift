//
//  CartPaymentViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation
import Stripe
import SwiftUI

class CartPaymentViewModel: BaseViewModel {
    
    func setup(event: Event) {
        self.event = event
    }
    var event: Event!
    var stripePaymentWebService: StripePaymentWebService!
    var getCreditsCardsWebService: GetCreditsCardsWebService!
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
    
    var paymentSheet: PaymentSheet? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var paymentResult: PaymentResult? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var userHasCards: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    func isUserHavingCards() {
        getCreditsCards(onCardsFound: { cards in
            self.userHasCards = true
        })
        
    }
    
    func preparePaymentSheet() {
        makeStripePaymentRequest()
    }
    
    func onPaymentCompletion(result: PaymentResult) {
        self.paymentResult = result
    }
    
    func createStripeCreditCard() {
        let registerStripeNewCreditCardParameters = RegisterStripeNewCreditCardParameters(number: number,
                                                                                          exp_month: exp_month,
                                                                                          exp_year: exp_year,
                                                                                          cvc: cvc,
                                                                                          name: owner)
        
        let serviceParameters = ExecuteServiceSetup(service: registerStripeNewCreditCard,
                                                    parameters: registerStripeNewCreditCardParameters)
        executeRequestWithURLEncoded(serviceParameters, onSuccess: { value in
            self.createStripeCreditCardOnServer(with: value.id)
            self.isUserHavingCards()
        }, onError: { error in
            print("VOILA L'ERREUR \(error)")
        })
    }
    
    private func createStripeCreditCardOnServer(with stripeIdCard: String) {
        let stripeIDServiceParameters = StripeIDServiceParameters(stripeId: stripeIdCard)
        let serviceParameters = ExecuteServiceSetup(service: createNewStripeCreditCardWebService, parameters: stripeIDServiceParameters, isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data)
        }, onError: { error in
            print(error)
        })
    }
    
    private func getCreditsCards(onCardsFound: @escaping ([CreditCard]) -> Void) {
        let serviceParameters = ExecuteServiceSetup(service: getCreditsCardsWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            onCardsFound(value.data)
        }, onError: { error in
            print(error)
        })
    }
    
    private func makeStripePaymentRequest() {
        let serviceParameters = ExecuteServiceSetup(service: stripePaymentWebService, parameters: EmptyParameters(), urlParameters: [event._id], isRequestAuthenticated: true)
        
        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data)
        }, onError: { error in
            print(error)
        })
    }
    
}
