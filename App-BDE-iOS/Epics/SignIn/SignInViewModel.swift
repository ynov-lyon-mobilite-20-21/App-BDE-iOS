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
    var loginWebService: LoginWebService!

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

        let dto = RegisterWebServiceParameters(mail: mail, password: password)
        executeRequest(loginWebService.call(dto, urlParameters: []), onSuccess: { value in
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
