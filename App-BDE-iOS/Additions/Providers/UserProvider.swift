//
//  UserProvider.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/04/2021.
//

import Foundation

class UserProvider: ObservableObject {
    
    static let shared: UserProvider = UserProvider()
    
    var user: User? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
}
