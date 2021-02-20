//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: BaseViewModel {
    
//    @Injected private var authentication: ApiRequestService
//    @Injected private var keyChainService: KeyChainService
//    @Injected private var userViewModel: UserViewModel
    
    @Published var mail: String = ""
    @Published var password: String = ""
    
    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false
        
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
        let loginWebService = LoginWebService()
        executeRequest(loginWebService.call(dto), onSuccess: { value in
            print(value.data.token)
            onEnd(.loaded)
        }, onError: { error in
            print(error)
        })
    }
}

enum LoadingStatus {
    case idle
    case loading
    case failed
    case loaded
}

//        authentication.login(dto).sink(
//            receiveCompletion: {
//                switch $0 {
//                case .failure(let error as ApiRequestError):
//                    DispatchQueue.main.async { [weak self] in
//                        guard let strongSelf = self else {return}
//                        strongSelf.showAlert = true
//                        strongSelf.requestStatus = error.rawValue
//                        strongSelf.loadingStatus = .failed
//                    }
//                case .finished:
//                    print("success")
//                case .failure(_): break
//                }
//            },
//            receiveValue: { [weak self] authToken in
//                guard let strongSelf = self else {return}
//                strongSelf.addStringInKeyChain(value: authToken.token, as: "UserToken")
//                strongSelf.authentication.getMe().sink(
//                    receiveCompletion: {
//                        switch $0 {
//                        case .failure(let error):
//                            print("ERROR : \(error)")
//                        case .finished:
//                            print("get me success")
//                        }
//                    },
//                    receiveValue: { user in
//                        DispatchQueue.main.async { [weak self] in
//                            guard let strongSelf = self else {return}
//                            strongSelf.userViewModel.user = user
//                            onEnd(.loaded)
//                        }
//
//                    }).store(in: &strongSelf.bag)
//            }
//        ).store(in: &bag)
