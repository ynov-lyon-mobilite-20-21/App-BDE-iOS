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
    @Injected private var userViewModel: UserViewModel
    
    var bag = Set<AnyCancellable>()
    
    @Published var loadingStatus: LoadingStatus = .idle
    @Published var requestStatus: String = ""
    @Published var showAlert: Bool = false
    
    public func handleSignIn(onEnd: @escaping (LoadingStatus) -> Void) {
        
        mailIsValid = !mail.emailValidation()
        self.passwordIsValid = self.password.isEmpty
        
        if passwordIsValid || mailIsValid {
            self.loadingStatus = .idle
            return
        }
        UIApplication.shared.endEditing() // Call to dismiss keyboard
        self.loadingStatus = .loading
        
        let dto = LoginDTO(mail: mail, password: password)
        authentication.login(dto).sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    DispatchQueue.main.async { [weak self] in
                        guard let strongSelf = self else {return}
                        switch error {
                        case ApiRequestError.badCredentials: do {
                            strongSelf.showAlert = true
                            strongSelf.requestStatus = ApiRequestError.badCredentials.rawValue
                        }
                        default: print(ApiRequestError.unknowError.rawValue)
                        }
                        strongSelf.loadingStatus = .failed
                    }
                case .finished:
                    print("success")
                }
            },
            receiveValue: { [weak self] authToken in
                guard let strongSelf = self else {return}
                strongSelf.addStringInKeyChain(value: authToken.token, as: "UserToken")
                strongSelf.authentication.getMe().sink(
                    receiveCompletion: {
                        switch $0 {
                        case .failure(let error):
                            print("ERROR : \(error)")
                        case .finished:
                            print("get me success")
                        }
                    },
                    receiveValue: { user in
                        DispatchQueue.main.async { [weak self] in
                            guard let strongSelf = self else {return}
                            strongSelf.userViewModel.user = user
                            onEnd(.loaded)
                        }

                    }).store(in: &strongSelf.bag)
            }
        ).store(in: &bag)
    }
}

enum LoadingStatus {
    case idle
    case loading
    case failed
    case loaded
}
