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

    var mail: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var password: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var lastName: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var firstName: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var formation: Formation = Formation.defaultValue {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var promotion: Promotion = Promotion.defaultValue {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var mailIsValid: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var passwordIsValid: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

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
