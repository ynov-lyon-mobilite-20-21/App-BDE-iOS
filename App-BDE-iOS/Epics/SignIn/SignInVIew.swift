//
//  SignInVIew.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 25/02/2021.
//

//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import SwiftUI

struct SignInView: View {

    @ObservedObject var viewModel: SignInViewModel

    @Environment(\.presentationMode) var presentation
    // TODO : Delete after DI refactoring
    @State private var showModal: Bool = false
    @State private var showAlert: Bool = false

    var body: some View {

        ZStack {
                NavigationView {
                    Form {
                        Section(header: Text(L10n.SignInView.Section.identifiers)) {
                            TextField(L10n.SignInView.TextField.mail, text: $viewModel.mail)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .border(Color.red,
                                        width: viewModel.mailIsValid ? 1 : 0)

                            SecureField(L10n.SignInView.TextField.password, text: $viewModel.password)
                                .textContentType(.password)
                                .border(Color.red,
                                        width: viewModel.passwordIsValid ? 1 : 0)
                        }
                        Button(action: {
                            viewModel.handleSignIn {
                                if $0 == .loaded {
                                    self.presentation.wrappedValue.dismiss()
                                }
                            }
                        }, label: {
                            HStack {
                                Spacer()
                                Text(L10n.SignInView.Button.signIn)
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
                    .navigationTitle(L10n.SignInView.Button.signIn)
                }
                .sheet(isPresented: self.$showModal) { ViewProvider.signUp() }

                if viewModel.loadingStatus == .loading {
                    LoadingView()
                }

        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.requestStatus), dismissButton: .default(Text("Ok")))
                }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView(viewModel: SignInViewModel())
            SignInView(viewModel: SignInViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
