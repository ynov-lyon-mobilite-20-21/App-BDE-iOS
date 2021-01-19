//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 07/11/2020.
//

import SwiftUI

struct SignUpView: View {
        
    @ObservedObject var viewModel: SignUpViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Identifiants")) {
                    TextField("Email", text: $viewModel.mail)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .border(Color.red,
                                width: viewModel.mailIsValid ? 1 : 0)
                    
                    SecureField("Mot de passe", text: $viewModel.password)
                        .textContentType(.password)
                        .border(Color.red,
                                width: viewModel.passwordIsValid ? 1 : 0)
                }
                
                Section(header: Text("Informations personnelles")) {
                    TextField("Prenom", text: $viewModel.firstName)
                        .textContentType(.name)
                        .disableAutocorrection(true)
                        .border(Color.red,
                                width: viewModel.mailIsValid ? 1 : 0)
                    
                    TextField("Nom", text: $viewModel.lastName)
                        .textContentType(.familyName)
                        .disableAutocorrection(true)
                        .border(Color.red,
                                width: viewModel.mailIsValid ? 1 : 0)
                }
                
                Section(header: Text("Informations étudiant")) {

                        Picker("Promotion", selection: $viewModel.promotion) {
                            ForEach(Promotion.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .foregroundColor(Color.bdeGreen)
                        .pickerStyle(DefaultPickerStyle())

                        Picker("Formation", selection: $viewModel.formation) {
                            ForEach(Formation.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .foregroundColor(Color.bdeGreen)
                        .pickerStyle(DefaultPickerStyle())

                }
                Button(action: {
                    viewModel.handleSignUp()
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
            SignUpView(viewModel: SignUpViewModel())
            SignUpView(viewModel: SignUpViewModel())
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
