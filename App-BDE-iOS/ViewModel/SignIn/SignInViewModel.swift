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
    
    enum LoadingStatus {
        case idle
        case loading
        case failed
        case loaded
    }
    
    @Published var mail: String = ""
    @Published var password: String = ""
    
    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false
    
    @Injected private var authentication: AuthenticationRequests

    var bag = Set<AnyCancellable>()
    var user: User?
    
    @Published var loadingStatus: LoadingStatus = .idle
    public func handleSignIn(onEnd: @escaping (LoadingStatus) -> Void) {
        
        self.loadingStatus = .loading
        
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty
        
        if passwordIsValid || mailIsValid {
            self.loadingStatus = .idle
            return
        }
        
        let dto = LoginDTO(mail: mail, password: password)
        authentication.login(dto).sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    DispatchQueue.main.async { [weak self] in
                        self?.loadingStatus = .failed
                    }
                    print("ERROR : \(error)")
                case .finished:
                    print("success")
                }
            },
            receiveValue: { [weak self] AuthToken in
                guard let strongSelf = self else {return}
                strongSelf.authentication.getMe(AuthToken.token).sink(
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
                        strongSelf.user = user
                        onEnd(.loaded)
                    }).store(in: &strongSelf.bag)
            }
        ).store(in: &bag)
    }
}
