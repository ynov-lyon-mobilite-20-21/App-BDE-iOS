//
//  AuthenticationRequests.swift
//  FYD
//
//  Created by Maxence Mottard on 30/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation
import Combine

final class AuthenticationRequests: Request {
    
    var bag = Set<AnyCancellable>()
    let keyChain = KeyChainService()
    
    func login(_ body: LoginDTO, onResult: @escaping (Result<Any, Error>) -> Void) {
        guard let url = URL(string: "https://lyon-ynov-bde-api.herokuapp.com/api/auth") else {
            return
        }
        request(url, httpMethod: .POST, body: body, decodeType: AuthToken.self).sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    onResult(.failure(error))
                case .finished: break
                }
            },
            receiveValue: { authToken in
                self.keyChain.addStringInKeyChain(value: authToken.token, as: "UserToken")
                onResult(.success(authToken))
            }
        ).store(in: &bag)
    }
    
    func getMe(onResult: @escaping (Result<Any, Error>) -> Void) {
        let userToken = keyChain.getStringInKeyChain(name: "UserToken")
        
        guard let url = URL(string: "https://lyon-ynov-bde-api.herokuapp.com/api/me") else {
            return
        }
        request(url, httpMethod: .GET, headers: ["Authorization":"Bearer \(userToken)"], decodeType: User.self).sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    onResult(.failure(error))
                case .finished: break
                }
            },
            receiveValue: { user in
                print(user)
                onResult(.success(user))
            }
        ).store(in: &bag)
    }
}
