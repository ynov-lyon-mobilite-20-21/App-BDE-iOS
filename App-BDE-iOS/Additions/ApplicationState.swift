//
//  File.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 31/03/2021.
//

import Foundation
import KeychainSwift
import JWTDecode

class ApplicationState: ObservableObject {
    static let shared = ApplicationState()
    private let keyChainService = KeyChainService.shared

    enum State {
        case loading
        case authenticated
        case loginNotRequired
        case requireLogin
    }
    
    var state: State = .loginNotRequired {
        didSet {
            objectWillChange.send()
        }
    }
    
    var jwtToken: String? {
        get { return keyChainService.getStringInKeyChain(name:"UserToken") }
        set(value) {
            guard let value = value else { return }
            keyChainService.addStringInKeyChain(value: value, as: "UserToken")
        }
    }
    
    var jwtRefreshToken: String? {
        get { return keyChainService.getStringInKeyChain(name:"UserRefreshToken") }
        set(value) {
            guard let value = value else { return }
            keyChainService.addStringInKeyChain(value: value, as: "UserRefreshToken")
        }
    }
    
    var jwtTokenIsExpired: Bool? {
        guard let token = jwtToken else { return nil }
        
        do {
            let jwt = try decode(jwt: token)

            return jwt.expired
        } catch {
            return nil
        }
    }
    
    func startApplication() {
        state = (jwtToken == nil) ? .requireLogin : .authenticated
    }
    
    func authenticate(with loginResult: AuthToken) {
        jwtToken = loginResult.token
        jwtRefreshToken = loginResult.refreshToken
        
        state = .authenticated
    }
    
    func disconnect() {
        jwtToken = nil
        jwtRefreshToken = nil
        
        state = .requireLogin
    }
}
