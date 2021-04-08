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

    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var lastName: String = ""
    @Published var firstName: String = ""
    @Published var formation: Formation = Formation.defaultValue
    @Published var promotion: Promotion = Promotion.defaultValue

    @Published var mailIsValid: Bool = false
    @Published var passwordIsValid: Bool = false

    func updateUserInformations() {
        
        let parameters = UpdateUserWebServiceParameters(mail: mail, password: password, firstName: firstName, lastName: lastName, promotion: promotion, formation: formation)
        let serviceParameters = ExecuteServiceSetup(service: updateUserWebService, parameters: parameters, isRequestAuthenticated: true)
        
        executeRequest(serviceParameters, onSuccess: { value in
            UserProvider.shared.user = value.data
        }, onError: { error in
            print(error)
        })
    }
}
