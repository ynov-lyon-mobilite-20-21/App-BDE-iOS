//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentation
    @InjectedObservedObject private var signInViewModel: SignInViewModel
    @State private var showModal: Bool = false
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        
        ZStack {
                NavigationView {
                    Form {
                        Section(header: Text("signInView.section1header".localized)) {
                            TextField("Email", text: $signInViewModel.mail)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .border(Color.red,
                                        width: signInViewModel.mailIsValid ? 1 : 0)
                            
                            SecureField("Mot de passe", text: $signInViewModel.password)
                                .textContentType(.password)
                                .border(Color.red,
                                        width: signInViewModel.passwordIsValid ? 1 : 0)
                        }
                        Button(action: {
                            signInViewModel.handleSignIn() {
                                if $0 == .loaded {
                                    self.presentation.wrappedValue.dismiss()
                                }
                            }
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Connexion")
                                Spacer()
                            }
                        }).foregroundColor(Color.bdeGreen)
                        
                        Button(action: {
                            showModal.toggle()
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Créer un compte")
                                Spacer()
                            }
                        }).foregroundColor(Color.bdeGreen)
                    }
                    .navigationTitle("Connexion")
                }
                .sheet(isPresented: self.$showModal) { SignUpView() }
                
                if signInViewModel.loadingStatus == .loading {
                    LoadingView()
                }

        }
        .alert(isPresented: $signInViewModel.showAlert) {
            Alert(title: Text(signInViewModel.requestStatus), dismissButton: .default(Text("Ok")))
                }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
            SignInView()
                .preferredColorScheme(.dark)
        }
    }
}


