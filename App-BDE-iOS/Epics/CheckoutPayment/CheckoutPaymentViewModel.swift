//
//  CheckoutPaymentViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 14/04/2021.
//

import Foundation
import Stripe
import Combine
import SwiftUI

class CheckoutPaymentViewModel: BaseViewModel {
    
    func setup(event: Event) {
        self.event = event
    }
    
    override init() {
        STPAPIClient.shared.publishableKey = "pk_test_51IQdCIJ1WCZboFuup0kXGkIJCovYp93MyosMvRzzHcYAfozlx9HeueVWMfoROvRgqJxt5yseiLJzbDPKBVx85rOJ00Sv9in454"
    }
    
    var event: Event!
    var getCreditsCardsWebService: GetCreditsCardsWebService!
    var stripePaymentWebService: StripePaymentWebService!
    var registerStripeNewCreditCard: RegisterStripeNewCreditCard!
    var createNewStripeCreditCardWebService: CreateNewStripeCreditCardWebService!
    
    var isShowingCardRegister: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    var userHasACardRegistered: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    var userHasPaid: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
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
    
    func verifyIfUserHasCardElsePay() {
        self.isLoading.toggle()
        getCreditsCards(onCardsFound: { cards in
            if cards.isEmpty {
                self.isLoading.toggle()
                self.userHasACardRegistered.toggle()
                self.isShowingCardRegister.toggle()
            } else {
                self.preparePayment()
            }
        })
    }
    
    func preparePayment() {
        makeStripePaymentRequest(onPaymentIntented: { stripePaymentResponse in
            DispatchQueue.main.async {
                if let appURL = URL(string: stripePaymentResponse.payLink) {
                    UIApplication.shared.open(appURL) { success in
                        if success {
                            print("The URL was delivered successfully.")
                        } else {
                            self.isLoading.toggle()
                            self.userHasPaid.toggle()
                            print("The URL failed to open.")
                        }
                    }
                } else {
                    print("Invalid URL specified.")
                }
                //                self.pay(with: paymentIntent.clientSecret, onPaymentDone: {
                //                    self.userHasPaid.toggle()
                //                })
            }
        })
    }
    
    func createNewCreditCards() {
        if number.isEmpty, exp_month.isEmpty, exp_year.isEmpty, cvc.isEmpty, owner.isEmpty {
            isLoading.toggle()
        } else {
            createStripeCreditCardOnStripeServer {
                self.userHasACardRegistered.toggle()
                self.isShowingCardRegister.toggle()
            }
        }
    }
    
    private func getCreditsCards(onCardsFound: @escaping ([CreditCard]) -> Void) {
        let serviceParameters = ExecuteServiceSetup(service: getCreditsCardsWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            onCardsFound(value.data)
        }, onError: { error in
            print(error)
        })
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
        executeRequest(serviceParameters, onSuccess: { _ in
            onCardCreated()
        }, onError: { error in
            print(error)
        })
    }
    
    private func makeStripePaymentRequest(onPaymentIntented: @escaping (StripePaymentResponse) -> Void) {
        let stripePaymentParameter = StripePaymentParameters(basicPaymentFallback: true)
        let serviceParameters = ExecuteServiceSetup(service: stripePaymentWebService, parameters: stripePaymentParameter, urlParameters: [event._id], isRequestAuthenticated: true)
        
        executeRequest(serviceParameters, onSuccess: { value in
            onPaymentIntented(value.data)
            
        }, onError: { error in
            print(error)
        })
    }
    
    private func pay(with paymentIntent: String, onPaymentDone: @escaping () -> Void) {
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: paymentIntent)
        let paymentHandler = STPPaymentHandler.shared()
        
        //        paymentHandler.confirmPayment(paymentIntentParams, with: self) { (status, paymentIntent, error) in
        //            switch (status) {
        //            case .failed:
        //                print("Payment fail")
        //            case .canceled:
        //                print("Payment cancel")
        //            case .succeeded:
        //                print("Payment Succeed")
        //                onPaymentDone()
        //            @unknown default:
        //                fatalError()
        //            }
        //        }
    }
}
