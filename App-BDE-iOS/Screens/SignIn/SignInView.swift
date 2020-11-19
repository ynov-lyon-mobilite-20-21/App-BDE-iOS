//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentation
    @InjectedObservedObject private var signInViewModel: SignInViewModel
    @State private var showModal: Bool = false


    var body: some View {
        GeometryReader { gr in
            VStack {
                HStack {
                    Button("Retour") {
                        self.presentation.wrappedValue.dismiss()
                    }
                    .padding()
                    Spacer()
                    Text("Créer un compte")
                    .padding()
                        .offset(x: -40)
                    
                    Spacer()
                }
                .background(Color.secondary)
                
                ScrollView {
                    VStack(alignment: .center) {

                        
                        TextField("Email", text: $signInViewModel.mail)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .border(Color.red,
                                               width: signInViewModel.mailIsValid ? 1 : 0)
                        
                        SecureField("Mot de passe", text: $signInViewModel.password)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .border(Color.red,
                                                width: signInViewModel.passwordIsValid ? 1 : 0)
                        
                        Button {
                            signInViewModel.handleSignIn()
                        } label: {
                            Text("Connexion")
                        }
                        Button {
                            showModal.toggle()

                        } label: {
                            Text("Créer un compte")
                        }
                    }
                }
            }
            
        }
        .background(
            ZStack {
                Color.whiteToBlue
                Image("background_event")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(colorScheme == .dark ? 0.2 : 1)
            })
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: self.$showModal) { SignUpView() }

    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
