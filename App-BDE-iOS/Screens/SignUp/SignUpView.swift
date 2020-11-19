//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 07/11/2020.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentation
    @InjectedObservedObject private var signUpViewModel: SignUpViewModel
    
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

                        
                        TextField("Email", text: $signUpViewModel.mail)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .border(Color.red,
                                               width: signUpViewModel.mailIsValid ? 1 : 0)
                        
                        TextField("Nom", text: $signUpViewModel.lastName)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .border(Color.red,
                                               width: signUpViewModel.mailIsValid ? 1 : 0)
                        
                        TextField("Prenom", text: $signUpViewModel.firstName)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .border(Color.red,
                                               width: signUpViewModel.mailIsValid ? 1 : 0)
                        
                        TextField("Photo", text: $signUpViewModel.pictureUrl)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .border(Color.red,
                                               width: signUpViewModel.mailIsValid ? 1 : 0)
                        
                        Picker(selection: $signUpViewModel.formation, label:
                         Text("Picker Name")) {
                            ForEach(Formation.allCases, id: \.self) {
                                Text($0.rawValue)
                                    .tag($0)
                            }
                         }
                        .pickerStyle(WheelPickerStyle())
                        
                        Picker(selection: $signUpViewModel.promotion, label:
                         Text("Picker Name")) {
                            ForEach(Promotion.allCases, id: \.self) {
                                Text($0.rawValue)
                                    .tag($0)
                            }
                         }
                        .pickerStyle(WheelPickerStyle())
                        
                        SecureField("Mot de passe", text: $signUpViewModel.password)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .border(Color.red,
                                                width: signUpViewModel.passwordIsValid ? 1 : 0)
                        
                        Button {
                            signUpViewModel.handleSignUp()
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
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
