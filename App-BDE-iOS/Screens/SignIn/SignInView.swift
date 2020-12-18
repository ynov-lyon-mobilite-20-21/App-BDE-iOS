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
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Identifiants")) {
                    TextField("Email", text: $signInViewModel.mail)
                        .border(Color.red,
                                width: signInViewModel.mailIsValid ? 1 : 0)
                    
                    SecureField("Mot de passe", text: $signInViewModel.password)
                        .border(Color.red,
                                width: signInViewModel.passwordIsValid ? 1 : 0)
                }
                Button(action: {
                        signInViewModel.handleSignIn()
//                        self.presentation.wrappedValue.dismiss()
                }, label: {
                            HStack {
                                Spacer()
                                Text("Connexion")
                                Spacer()
                            }
                        })
                
                Button(action: {
                    showModal.toggle()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Créer un compte")
                        Spacer()
                    }
                })
            }
            .navigationTitle("Connexion")
        }
        .sheet(isPresented: self.$showModal) { SignUpView() }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
