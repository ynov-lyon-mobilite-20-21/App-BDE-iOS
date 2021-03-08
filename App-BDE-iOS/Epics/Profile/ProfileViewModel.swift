//
//  ProfilViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation

class ProfileViewModel: BaseViewModel {
    
    var getUserWebService: GetUserWebService!

    func checkIfUserAuth() {
        if !isAuthenticated {
            TabViewProvider.shared.changeTab(to: .event)
            return
        }
        let serviceParameters = ExecuteServiceSetup(service: getUserWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            print(value)
        })
    }
}
