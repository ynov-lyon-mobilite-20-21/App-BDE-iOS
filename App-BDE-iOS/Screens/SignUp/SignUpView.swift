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
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .border(Color.red,
                                width: signUpViewModel.mailIsValid ? 1 : 0)
                    
                    SecureField("Mot de passe", text: $signUpViewModel.password)
                        .textContentType(.password)
                        .border(Color.red,
                                width: signUpViewModel.passwordIsValid ? 1 : 0)
                }
                
                Section(header: Text("Informations personnelles")) {
                    TextField("Prenom", text: $signUpViewModel.firstName)
                        .textContentType(.name)
                        .disableAutocorrection(true)
                        .border(Color.red,
                                width: signUpViewModel.mailIsValid ? 1 : 0)
                    
                    TextField("Nom", text: $signUpViewModel.lastName)
                        .textContentType(.familyName)
                        .disableAutocorrection(true)
                        .border(Color.red,
                                width: signUpViewModel.mailIsValid ? 1 : 0)
                }
                
                Section(header: Text("Informations étudiant")) {

                        Picker("Promotion", selection: $signUpViewModel.promotion) {
                            ForEach(Promotion.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .foregroundColor(Color.bdeGreen)
                        .pickerStyle(DefaultPickerStyle())

                        Picker("Formation", selection: $signUpViewModel.formation) {
                            ForEach(Formation.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .foregroundColor(Color.bdeGreen)
                        .pickerStyle(DefaultPickerStyle())

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
                        }).foregroundColor(Color.bdeGreen)
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
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
