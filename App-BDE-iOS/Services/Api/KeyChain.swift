//
//  KeyChain.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/11/2020.
//

import Foundation
import Security

class KeyChain {
    
    func AddToKeyChain() {
        
        let keychainItem = [
            kSecValueData: "com.ynovlyon.bde".data(using: .utf8)!,
            kSecClass: kSecClassKey,
            kSecReturnData: true,
            kSecReturnAttributes: true
        ] as CFDictionary
        
        let ref: AnyObject? = NSDictionary()
        
        let status = SecItemAdd(keychainItem, nil)
        let result = ref as! NSDictionary
        print("Operation finished with status: \(status)")
        print("Returned attributes:")
        result.forEach { key, value in
            print("\(key): \(value)")
        }
    }
}
