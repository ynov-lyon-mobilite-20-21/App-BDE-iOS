//
//  File.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 12/04/2021.
//

import Foundation

class UserRepository: ObservableObject {
    
    var user: User? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
}
