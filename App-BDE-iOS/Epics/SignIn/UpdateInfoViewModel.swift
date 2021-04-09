//
//  SignInViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import Foundation
import SwiftUI
import Combine

class UpdateInfoViewModel: BaseViewModel {
    
    var updateUserWebService: UpdateUserWebService!

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
    var formation: Formation = Formation.defaultValue {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var promotion: Promotion = Promotion.defaultValue {
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

    func updateUserInformations() {
        
        let parameters = UpdateUserWebServiceParameters(mail: mail, password: password, firstName: firstName, lastName: lastName, promotion: promotion, formation: formation)
        let serviceParameters = ExecuteServiceSetup(service: updateUserWebService, parameters: parameters, isRequestAuthenticated: true)
        
        executeRequest(serviceParameters, onSuccess: { value in
            print("User updated : \(value.data)")
            UserProvider.shared.user = value.data
        }, onError: { error in
            print(error)
        })
    }
}
