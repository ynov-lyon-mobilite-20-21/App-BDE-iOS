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
    @Published var photo: String = ""
    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false
    
    @Injected private var authenticationRequests: AuthenticationRequests
        
        var bag = Set<AnyCancellable>()
        
        public func handleLogin() {
            mailIsValid = !mail.emailValidation()
            self.passwordIsValid = self.password.isEmpty
            
            if passwordIsValid || mailIsValid {
                return
            }
            
            let dto = LoginDTO(mail: mail, password: password)
            authenticationRequests.login(dto).sink(
                receiveCompletion: { print($0) },
                receiveValue: { user in
                    print(user)
                }
            ).store(in: &bag)
        }
}
