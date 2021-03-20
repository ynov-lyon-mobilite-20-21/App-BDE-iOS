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

    func addStringInKeyChain(value: String, as name: String) {
        keychain.set(value, forKey: name)
    }

    func getStringInKeyChain(name: String) -> String {
        return keychain.get(name)!
    }
}
