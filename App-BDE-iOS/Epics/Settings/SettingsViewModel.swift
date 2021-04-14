//
//  SettingsViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/02/2021.
//

import Foundation

class SettingsViewModel: BaseViewModel {

    var userRepository: UserRepository!
    var deleteUserWebService: DeleteUserWebService!
    
    func deleteUser() {
        let serviceParameters = ExecuteServiceSetup(service: deleteUserWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        
        executeRequestWithoutDecode(serviceParameters, onSuccess: {
            KeyChainService.shared.deleteAllElement()
            self.userRepository.setUser(with: nil)
        }, onError: { error in
            print(error)
        })
    }
    
    func logout() {
        disconnect()
        userRepository.setUser(with: nil)
    }
    
    func checkUser() {
        guard let user = userRepository.getUser() else {
            print("ya pas de user : \(String(describing: userRepository.getUser()))")
            return
        }
        print("Voila le user : \(user)")
    }
}
