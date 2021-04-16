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
    var formation: User.Formation = User.Formation.defaultValue {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var promotion: User.Promotion = User.Promotion.defaultValue {
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
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

    var user: SignUpDTO?

    public func handleSignUp(onSignUp: @escaping () -> Void) {
        isLoading.toggle()
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty

        if passwordIsValid || mailIsValid {
            isLoading.toggle()
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
            onSignUp()
        })
    }
}
