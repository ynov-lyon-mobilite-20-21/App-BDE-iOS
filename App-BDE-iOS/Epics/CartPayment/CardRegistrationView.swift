//
//  CartPaymentView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import SwiftUI
import Stripe

struct CardRegistrationView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: CardRegistrationViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Form {
                        Section(header: Text(L10n.CardPayment.CreditCard.number), content: {
                            TextField(L10n.CardPayment.CreditCard.number, text: $viewModel.number)
                        })
                        
                        Section(header: Text(L10n.CardPayment.CreditCard.owner), content: {
                            TextField(L10n.CardPayment.CreditCard.owner, text: $viewModel.owner)
                        })
                        
                        Section(header: Text(L10n.CardPayment.CreditCard.expirationMonth), content: {
                            TextField("test", text: $viewModel.exp_month)
                            
                        })
                        
                        Section(header: Text(L10n.CardPayment.CreditCard.expirationYear), content: {
                            TextField("test", text: $viewModel.exp_year)
                            
                        })
                        
                        Section(header: Text(L10n.CardPayment.CreditCard.cvc), content: {
                            TextField("test", text: $viewModel.cvc)
                            
                        })
                        Button(action: {
                            viewModel.createStripeCreditCardOnStripeServer {
                                self.presentation.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            HStack {
                                Spacer()
                                Text(L10n.CardPayment.Button.addCard)
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 70)
                                Spacer()
                            }
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blueToGreenGradiantStartingPoint, Color.blueToGreenGradiantEndingPoint]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(30)
                        })
                    }

                }
                .navigationTitle(L10n.CardPayment.title)
            }
        }
    }
}

struct CardRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        CardRegistrationView(viewModel: CardRegistrationViewModel())
    }
}
