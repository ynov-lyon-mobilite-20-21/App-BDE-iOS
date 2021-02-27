//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import SwiftUI

struct UpdateInfoView: View {
    
    @ObservedObject var viewModel: UpdateInfoViewModel
    
    var body: some View {
            VStack {
                List {
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
                    
                    Section(header: Text("Identifiants")) {

                        SecureField("Ancien mot de passe", text: $viewModel.password)
                            .textContentType(.password)
                            .border(Color.red,
                                    width: viewModel.passwordIsValid ? 1 : 0)
                        
                        SecureField("Mot de passe", text: $viewModel.password)
                            .textContentType(.password)
                            .border(Color.red,
                                    width: viewModel.passwordIsValid ? 1 : 0)
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
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Mettre à jour mes données")
                            Spacer()
                        }
                    }).foregroundColor(Color.bdeGreen)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationBarTitle("Update", displayMode: .inline)
    }
}

struct UpdateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpdateInfoView(viewModel: UpdateInfoViewModel())
            UpdateInfoView(viewModel: UpdateInfoViewModel())
                .preferredColorScheme(.dark)
        }
    }
}


