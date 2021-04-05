//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/11/2020.
//

import Foundation
import SwiftUI
import Combine

class SignUpViewModel: BaseViewModel {
    
    var signUpWebService: SignUpWebService!

    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var lastName: String = ""
    @Published var firstName: String = ""
    @Published var formation: Formation = Formation.defaultValue
    @Published var promotion: Promotion = Promotion.defaultValue

    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false

    var user: SignUpDTO?

    public func handleSignUp() {
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty

        if passwordIsValid || mailIsValid {
            return
        }

        UIApplication.shared.endEditing() // Call to dismiss keyboard

        let dto = SignUpDTO(mail: mail,
                            password: password,
                            firstName: firstName,
                            lastName: lastName,
                            formation: formation.rawValue,
                            promotion: promotion.rawValue)
        let serviceParameters = ExecuteServiceSetup(service: signUpWebService, parameters: dto)
        
        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data)
        })
    }
}
