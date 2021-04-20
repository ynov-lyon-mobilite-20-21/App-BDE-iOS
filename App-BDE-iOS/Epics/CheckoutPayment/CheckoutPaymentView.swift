//
//  CheckoutPaymentView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 14/04/2021.
//

import SwiftUI

struct CheckoutPaymentView: View {
    
    @ObservedObject var viewModel: CheckoutPaymentViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.userHasPaid {
                VStack {
                    CheckoutTicketSucceedView()
                        .frame(width: 100, height: 100)
                }
                .animation(.easeInOut)
            } else {
                ScrollView {
                    VStack(spacing: 50) {
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("1 place chupitos")
                                Spacer()
                                Text("5 euros")
                            }
                            Text("Tarif adhérent")
                        }
                        .padding()
                        .background(Color.bdeForm)
                        .cornerRadius(10)
                        
                        VStack {
                            if viewModel.userHasACardRegistered {
                                VStack {
                                    HStack {
                                        Circle()
                                            .frame(width: 10, height: 10)
                                        Text(L10n.CardPayment.CreditCard.indications)
                                        Spacer()
                                        HStack {
                                            Image(Asset.Checkout.mastercard.name)
                                            Image(Asset.Checkout.visa.name)
                                            Image(Asset.Checkout.cb.name)
                                        }
                                        .padding(.trailing, 8)
                                    }
                                    VStack(alignment: .leading) {
                                        
                                        VStack(alignment: .leading) {
                                            Text(L10n.CardPayment.CreditCard.number)
                                            TextField("", text: $viewModel.number)
                                                .padding(8)
                                                .foregroundColor(Color.black)
                                                .background(Color.white)
                                                .cornerRadius(5)
                                        }
                                        VStack(alignment: .leading) {
                                            Text(L10n.CardPayment.CreditCard.owner)
                                            TextField("", text: $viewModel.owner)
                                                .padding(8)
                                                .foregroundColor(Color.black)
                                                .background(Color.white)
                                                .cornerRadius(5)
                                        }
                                        HStack(spacing: 40) {
                                            VStack(alignment: .leading) {
                                                Text(L10n.CardPayment.CreditCard.expirationDate)
                                                HStack {
                                                    TextField("", text: $viewModel.exp_month)
                                                        .padding(8)
                                                        .foregroundColor(Color.black)
                                                        .background(Color.white)
                                                        .cornerRadius(5)
                                                    
                                                    TextField("", text: $viewModel.exp_year)
                                                        .padding(8)
                                                        .foregroundColor(Color.black)
                                                        .background(Color.white)
                                                        .cornerRadius(5)
                                                }
                                            }
                                            VStack(alignment: .leading) {
                                                Text(L10n.CardPayment.CreditCard.cvc)
                                                TextField("", text: $viewModel.cvc)
                                                    .padding(8)
                                                    .foregroundColor(Color.black)
                                                    .background(Color.white)
                                                    .cornerRadius(5)
                                            }
                                            .padding(.leading, 15)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.bdeForm)
                                    .cornerRadius(10)
                                }
                                .transition(.slide)
                            }
                        }
                        .animation(.default)
                        
                        if viewModel.isLoading {
                            LoadingView()
                                .frame(width: 100, height: 100)
                        } else {
                            Button(action: {
                                if viewModel.isShowingCardRegister {
                                    viewModel.createNewCreditCards()
                                } else {
                                    viewModel.verifyIfUserHasCardElsePay()
                                }
                            },
                            label: {
                                HStack {
                                    Text(!viewModel.userHasACardRegistered ? L10n.EventDetail.Button.payment : L10n.CheckoutPayment.Button.cardRegistration)
                                        .foregroundColor(Color.white)
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 70)
                                }
                                .background(LinearGradient(gradient: Gradient(colors: [Color.blueToGreenGradiantStartingPoint, Color.blueToGreenGradiantEndingPoint]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(30)
                            })
                            .shadow(radius: 8)
                        }
                    }
                    .padding(.horizontal, 30)
                    .navigationTitle(L10n.CheckoutPayment.title)
                }
                .padding(.top, 50)
            }
        }
    }
}

struct CheckoutPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckoutPaymentView(viewModel: CheckoutPaymentViewModel())
            CheckoutPaymentView(viewModel: CheckoutPaymentViewModel())
                .previewDevice("iPhone 8")
        }
    }
}
