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

    @State private var selection = 0
    
    var body: some View {
        GeometryReader { gr in
            ScrollView {
                VStack(alignment: .center) {
                    HStack {
                        Button("Retour") {
                            self.presentation.wrappedValue.dismiss()
                        }
                        .padding()
                        Spacer()
                        Text("Connexion")
                        .padding()
                            .offset(x: -40)
                        
                        Spacer()
                    }
                    .background(Color.secondary)
                    
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
                    
                    TextField("Photo", text: $signUpViewModel.photo)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
                                   .border(Color.red,
                                           width: signUpViewModel.mailIsValid ? 1 : 0)
                    
                    
                    
//                    Picker(selection: $selection, label:
//                     Text("Picker Name")) {
//                        ForEach(Formation.allCases, id: \.self) {
//                            Text($0.rawValue)
//                         }
//                     }
//                    .pickerStyle(WheelPickerStyle())
                    
                    SecureField("Mot de passe", text: $signUpViewModel.password)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .border(Color.red,
                                            width: signUpViewModel.passwordIsValid ? 1 : 0)
                    
                    Button {
                        signUpViewModel.handleLogin()
                    } label: {
                        Text("Login")
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
