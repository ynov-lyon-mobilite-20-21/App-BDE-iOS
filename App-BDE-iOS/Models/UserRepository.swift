//
//  File.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 12/04/2021.
//

import Foundation

class UserRepository: ObservableObject {
    
    private var user: User?
    
    func setUser(with userData: User?) {
        guard let user = userData else {
            self.user = nil
            return
        }
        self.user = user
    }
    
    func getUser() -> User? {
        guard let user = user else {
            return nil
        }
        return user
    }
}
