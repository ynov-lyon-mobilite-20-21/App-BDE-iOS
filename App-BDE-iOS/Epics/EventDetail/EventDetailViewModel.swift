//
//  EventDetailViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 28/03/2021.
//

import Foundation
import Stripe
import SwiftUI

class EventDetailViewModel: BaseViewModel {
    
    func setup(event: Event) {
        self.event = event
        STPAPIClient.shared.publishableKey = "pk_test_51IQdCIJ1WCZboFuup0kXGkIJCovYp93MyosMvRzzHcYAfozlx9HeueVWMfoROvRgqJxt5yseiLJzbDPKBVx85rOJ00Sv9in454"
    }
    
    var getCreditsCardsWebService: GetCreditsCardsWebService!
    var stripePaymentWebService: StripePaymentWebService!

    var event: Event!
    var showModal: Sheet? {
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

    enum Sheet: String, Identifiable {
        var id: String {
            rawValue
        }
        case qrCodeScanner
        case cardRegistration
    }
    
    func showQrCodeScanner() {
        showModal = .qrCodeScanner
    }
    
    func showCardRegistration() {
        showModal = .cardRegistration
    }
    
    func isUserHavingCards() {
        getCreditsCards(onCardsFound: { cards in
            if cards.isEmpty {
                self.showCardRegistration()
            } else {
                self.preparePaymentSheet()
            }
        })
    }
    
    func preparePaymentIfUserHasCard() {
        getCreditsCards(onCardsFound: { cards in
            guard !cards.isEmpty else {
                return
            }
            self.preparePaymentSheet()
        })
    }
    
    func preparePaymentSheet() {
        let configuration = PaymentSheet.Configuration()
        makeStripePaymentRequest(onPaymentIntented: { paymentIntent in
            DispatchQueue.main.async {
                self.paymentSheet = PaymentSheet(paymentIntentClientSecret: paymentIntent.clientSecret, configuration: configuration)
            }
        })
    }
    
    func onPaymentCompletion(result: PaymentResult) {
      self.paymentResult = result
    }
    
    private func getCreditsCards(onCardsFound: @escaping ([CreditCard]) -> Void) {
        let serviceParameters = ExecuteServiceSetup(service: getCreditsCardsWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            onCardsFound(value.data)
        }, onError: { error in
            print(error)
        })
    }
    
    private func makeStripePaymentRequest(onPaymentIntented: @escaping (StripePaymentResponse) -> Void) {
        let serviceParameters = ExecuteServiceSetup(service: stripePaymentWebService, parameters: EmptyParameters(), urlParameters: [event._id], isRequestAuthenticated: true)
        
        executeRequest(serviceParameters, onSuccess: { value in
            onPaymentIntented(value.data)
        }, onError: { error in
            print(error)
        })
    }
}
