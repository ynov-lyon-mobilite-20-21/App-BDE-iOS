//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/11/2020.
//

import Foundation
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var lastName: String = ""
    @Published var firstName: String = ""
    @Published var formation: Formation = Formation.defaultValue
    @Published var promotion: Promotion = Promotion.defaultValue
    @Published var pictureUrl: String = ""
    
    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false
    
    @Injected private var signUpRequest: SignUpRequests
    
    var bag = Set<AnyCancellable>()
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
                            promotion: promotion.rawValue,
                            pictureUrl: pictureUrl)
        signUpRequest.signUp(dto).sink(
            receiveCompletion: { print($0) },
            receiveValue: { [weak self] user in
                guard let strongSelf = self else {return}
                strongSelf.user = user
                
                //solution 2 pour tester que self est pas nul
//                if let strongSelf = self {
//                    strongSelf.user = user
//                }
            }
        ).store(in: &bag)
    }
}
