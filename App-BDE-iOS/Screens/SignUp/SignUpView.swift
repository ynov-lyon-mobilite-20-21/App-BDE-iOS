//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 07/11/2020.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentation
    @InjectedObservedObject private var signUpViewModel: SignUpViewModel
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Identifiants")) {
                    TextField("Email", text: $signUpViewModel.mail)
                        .border(Color.red,
                                width: signUpViewModel.mailIsValid ? 1 : 0)
                    
                    SecureField("Mot de passe", text: $signUpViewModel.password)
                        .border(Color.red,
                                width: signUpViewModel.passwordIsValid ? 1 : 0)
                }
                
                Section(header: Text("Informations personnelles")) {
                    TextField("Prenom", text: $signUpViewModel.firstName)
                        .border(Color.red,
                                width: signUpViewModel.mailIsValid ? 1 : 0)
                    
                    TextField("Nom", text: $signUpViewModel.lastName)
                        .border(Color.red,
                                width: signUpViewModel.mailIsValid ? 1 : 0)
                }
                
                Section(header: Text("Informations étudiant")) {
                    HStack {
                        Picker("Promotion", selection: $signUpViewModel.promotion) {
                            ForEach(Promotion.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        Spacer()
                        Text(signUpViewModel.promotion.rawValue)
                    }
                    HStack {
                        Picker("Formation", selection: $signUpViewModel.formation) {
                            ForEach(Formation.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        Spacer()
                        Text(signUpViewModel.formation.rawValue)
                    }
                }
                Button(action: {
                        signUpViewModel.handleSignUp()
                        self.presentation.wrappedValue.dismiss()
                }, label: {
                            HStack {
                                Spacer()
                                Text("Créer un compte")
                                Spacer()
                            }
                        })
            }
            .navigationTitle("Créer un compte")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
            SignUpView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
