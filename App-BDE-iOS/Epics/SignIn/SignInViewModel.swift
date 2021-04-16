//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: BaseViewModel {
    
    var loginWebService: LoginWebService!

    @Published var mail: String = ""
    @Published var password: String = ""

    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false

    @Published var requestStatus: String = ""
    @Published var showSignUp: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    var showAlert: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    @Published var alertTitle: String = ""
    @Published var alertDescription: String = ""
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

    
    func handleSignIn(onSigned: @escaping () -> Void) {
        isLoading.toggle()
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty

        if passwordIsValid || mailIsValid {
            isLoading.toggle()
            return
        }
        UIApplication.shared.endEditing() // Call to dismiss keyboard

        let dto = RegisterWebServiceParameters(mail: mail, password: password)
        let serviceParameters = ExecuteServiceSetup(service: loginWebService, parameters: dto)
        
        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data.token)
            KeyChainService.shared.addTokensInKeyChain(token: value.data.token, refreshToken: value.data.refreshToken)
            onSigned()
        }, onError: { error in
            print(error)
            self.alertTitle = error.title
            self.alertDescription = error.description
            self.showAlert = true
        })
    }
    
    func showSignUpView() {
        showSignUp = true
    }
}
