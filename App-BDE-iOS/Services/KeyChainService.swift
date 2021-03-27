//
//  KeyChainService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 30/12/2020.
//

import Foundation
import KeychainSwift

class KeyChainService: ObservableObject {

    private let keychain = KeychainSwift()
    static let shared = KeyChainService()
    
    func addTokensInKeyChain(token: String, refreshToken: String) {
        keychain.set(token, forKey: "UserToken")
        keychain.set(refreshToken, forKey: "UserRefreshToken")
    }
    
    func addStringInKeyChain(value: String, as name: String) {
        keychain.set(value, forKey: name)
    }
    
    func getStringInKeyChain(name: String) -> String? {
        return keychain.get(name)
    }
    
    func removeStringInKeyChain(name: String) -> Bool {
        return keychain.delete(name)
    }
    
    func deleteAllElement() {
        keychain.clear()
    }
}
