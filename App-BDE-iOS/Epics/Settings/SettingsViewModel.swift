//
//  SettingsViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/02/2021.
//

import Foundation

class SettingsViewModel: BaseViewModel {

    var deleteUserWebService: DeleteUserWebService!
    
    func deleteUser() {
        let serviceParameters = ExecuteServiceSetup(service: deleteUserWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        
        executeRequestWithoutDecode(serviceParameters, onSuccess: {
            KeyChainService.shared.deleteAllElement()
        }, onError: { error in
            print(error)
        })
    }
    
    func logout() {
        disconnect()
    }
}
