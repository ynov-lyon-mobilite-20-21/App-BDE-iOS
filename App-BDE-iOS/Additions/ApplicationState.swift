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
    private let keychain = KeychainSwift()
    
    enum State {
        case loading
        case authenticated
        case requireLogin
    }
    
    var state: State = .loading {
        didSet {
            objectWillChange.send()
        }
    }
    
    var jwtToken: String? {
        get { return keychain.get("bearer-token") }
        set(value) {
            guard let value = value else { return }
            keychain.set(value, forKey: "bearer-token")
        }
    }
    
    var jwtRefreshToken: String? {
        get { return keychain.get("bearer-refresh-token") }
        set(value) {
            guard let value = value else { return }
            keychain.set(value, forKey: "bearer-refresh-token")
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
