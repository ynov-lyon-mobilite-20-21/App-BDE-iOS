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
            if viewModel.isLoading {
                LoadingView()
                    .frame(width: 200, height: 200)
            } else {
                Form {
                    Section(header: Text(L10n.SignUpView.Section.identifiers)) {
                        TextField(L10n.SignUpView.TextField.Identifiers.mail, text: $viewModel.mail)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .border(Color.red,
                                    width: viewModel.mailIsValid ? 1 : 0)

                        SecureField(L10n.SignUpView.TextField.Identifiers.password, text: $viewModel.password)
                            .textContentType(.password)
                            .border(Color.red,
                                    width: viewModel.passwordIsValid ? 1 : 0)
                    }

                    Section(header: Text(L10n.SignUpView.Section.personalInfos)) {
                        TextField(L10n.SignUpView.TextField.PersonalInfos.firstName, text: $viewModel.firstName)
                            .textContentType(.name)
                            .disableAutocorrection(true)
                            .border(Color.red,
                                    width: viewModel.mailIsValid ? 1 : 0)

                        TextField(L10n.SignUpView.TextField.PersonalInfos.name, text: $viewModel.lastName)
                            .textContentType(.familyName)
                            .disableAutocorrection(true)
                            .border(Color.red,
                                    width: viewModel.mailIsValid ? 1 : 0)
                    }

                    Section(header: Text(L10n.SignUpView.Section.studentInfos)) {
                        
                        Picker(L10n.SignUpView.TextField.StudentInfos.promotion, selection: $viewModel.promotion) {
                            ForEach(User.Promotion.allCases, id: \.self) { promotion in
                                    Text(promotion.rawValue)
                                        .tag(promotion)
                                }
                            }
                            .foregroundColor(Color.bdeGreen)
                            .pickerStyle(DefaultPickerStyle())

                        Picker(L10n.SignUpView.TextField.StudentInfos.formation, selection: $viewModel.formation) {
                            ForEach(User.Formation.allCases, id: \.self) { formation in
                                    Text(formation.rawValue)
                                        .tag(formation)
                                }
                            }
                            .foregroundColor(Color.bdeGreen)
                            .pickerStyle(DefaultPickerStyle())

                    }
                    Button(action: {
                        viewModel.handleSignUp(onSignUp: {
                            self.presentation.wrappedValue.dismiss()
                            self.viewModel.isLoading.toggle()
                        })
                    }, label: {
                                HStack {
                                    Spacer()
                                    Text(L10n.SignUpView.Button.signUp)
                                    Spacer()
                                }
                            }).foregroundColor(Color.bdeGreen)
                }
                .navigationTitle(L10n.SignUpView.Button.signUp)
            }
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
