//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: KeyChainService, ObservableObject {
    
    @Published var mail: String = ""
    @Published var password: String = ""
    
    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false
    
    @Injected private var authentication: ApiRequestService

    var bag = Set<AnyCancellable>()
    var user: User?
    
    @Published var loadingStatus: LoadingStatus = .idle
    @Published var requestStatus: String = ""
    @Published var showAlert: Bool = false
    
    public func handleSignIn(onEnd: @escaping (LoadingStatus) -> Void) {
        
        self.loadingStatus = .loading
        
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty
        
        if passwordIsValid || mailIsValid {
            self.loadingStatus = .idle
            return
        }
        
        let dto = LoginDTO(mail: mail, password: password)
        authentication.login(dto) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    switch error {
                    case ApiRequestError.badCredentials: do {
                        self?.showAlert = true
                        self?.requestStatus = ApiRequestError.badCredentials.rawValue
                    }

                    default: print(ApiRequestError.unknowError.rawValue)
                    }
                    self?.loadingStatus = .failed
                }
            case .success:
                self.authentication.getMe() { result in
                    switch result {
                    case .success:
                        onEnd(.loaded)
                    case .failure(_):
                        DispatchQueue.main.async { [weak self] in
                            self?.loadingStatus = .failed
                        }
                    }
                }
            }
        }

    }
}

enum LoadingStatus {
    case idle
    case loading
    case failed
    case loaded
}
