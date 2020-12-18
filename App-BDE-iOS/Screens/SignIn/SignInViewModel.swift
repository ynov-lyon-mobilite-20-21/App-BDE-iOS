//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var mail: String = ""
    @Published var password: String = ""
    
    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false
    
    @Injected private var authentication: AuthenticationRequests

    var bag = Set<AnyCancellable>()
    var user: SignUpDTO?
    
    public func handleSignIn() {
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty
        
        if passwordIsValid || mailIsValid {
            return
        }
        
        let dto = LoginDTO(mail: mail,
                            password: password)
        authentication.login(dto).sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print("ERROR : \(error)")
                case .finished:
                    print("success")
                }
            },
            receiveValue: { AuthToken in
                self.authentication.getMe(AuthToken.token).sink(
                    receiveCompletion: {
                        switch $0 {
                        case .failure(let error):
                            print("ERROR : \(error)")
                        case .finished:
                            print("get me success")
                        }
                    },
                    receiveValue: { user in
                        print("user : ", user)
                    })
            }
        ).store(in: &bag)
    }
}
