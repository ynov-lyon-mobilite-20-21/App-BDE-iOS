//
//  ProfilViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation

class ProfileViewModel: BaseViewModel {
    
    var getUserWebService: GetUserWebService!
    
    enum Sheet: String, Identifiable {
        var id: String {
            rawValue
        }
        case login
        case settings
        case qrCode
    }
    
    var showModal: Sheet? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    var user: User? = nil {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    func showSettings() {
        showModal = .settings
    }

    func checkIfUserAuth() {
        if !isAuthenticated {
            showModal = .login
            return
        }
        getUser()
    }
    
    func redirectToEvent() {
        if !isAuthenticated {
            TabViewProvider.shared.changeTab(to: .event)
            return
        }
        getUser()
    }
    
    private func getUser() {
        let serviceParameters = ExecuteServiceSetup(service: getUserWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data)
            self.user = value.data
            UserProvider.shared.user = value.data
        })
    }
}
