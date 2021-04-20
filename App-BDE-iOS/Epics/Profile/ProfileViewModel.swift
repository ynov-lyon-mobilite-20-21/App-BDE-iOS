//
//  ProfilViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation

class ProfileViewModel: BaseViewModel {
    
    var getUserWebService: GetUserWebService!
    var getUserTicketsWebService: GetUserTicketsWebService!
    
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
    
    var userTickets: [Ticket] = [] {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    var userTicket: Ticket? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    func showSettings() {
        showModal = .settings
    }
    
    func showTicket(with ticket: Ticket) {
        userTicket = ticket
        showModal = .qrCode
    }

    func checkIfUserAuth() {
        if !isAuthenticated {
            showModal = .login
            return
        }
        getUser()
        getTickets()
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
    
    private func getTickets() {
        let serviceParameters = ExecuteServiceSetup(service: getUserTicketsWebService, parameters: EmptyParameters(), isRequestAuthenticated: true)
        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data.first?.qrCodeString)
            self.userTickets = value.data
        }, onError: { error in
            print(error)
        })
    }
}
