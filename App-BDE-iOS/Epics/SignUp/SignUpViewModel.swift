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
        
        let dto = SignUpDTO(mail: mail,
                            password: password,
                            firstName: firstName,
                            lastName: lastName,
                            formation: formation.rawValue,
                            promotion: promotion.rawValue)
//        signUpRequest.signUp(dto).sink(
//            receiveCompletion: {
//
//                switch $0 {
//                case .failure(let error):
//                    print("ERROR : \(error)")
//                case .finished:
//                    print("succes")
//                }
//            },
//            receiveValue: { [weak self] user in
//
//                print(user)
//                guard let strongSelf = self else {return}
//                strongSelf.user = user
//            }
//        ).store(in: &bag)
    }
}
