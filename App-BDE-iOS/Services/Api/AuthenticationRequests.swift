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
    
    func loginUser(with dto: LoginDTO) {
        self.login(dto).sink(
            receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print("ERROR : \(error)")
                case .finished:
                    print("success")
                }
            },
            receiveValue: { [weak self] AuthToken in
                guard let strongSelf = self else {return}
                strongSelf.getMe(AuthToken.token).sink(
                    receiveCompletion: {
                        switch $0 {
                        case .failure(let error):
                            print("ERROR : \(error)")
                        case .finished:
                            print("get me success")
                        }
                    },
                    receiveValue: { user in
                    }).store(in: &strongSelf.bag)
            }
        ).store(in: &bag)
    }
    
    func login(_ body: LoginDTO) -> AnyPublisher<AuthToken, Error> {
        guard let url = URL(string: "https://lyon-ynov-bde-api.herokuapp.com/api/auth") else {
            return AnyPublisher(Empty())
        }
        return request(url, httpMethod: .POST, body: body, decodeType: AuthToken.self)
    }
    
    func getMe(_ token: String) -> AnyPublisher<User, Error> {
        guard let url = URL(string: "https://lyon-ynov-bde-api.herokuapp.com/api/me") else {
            return AnyPublisher(Empty())
        }
        return request(url, httpMethod: .GET, headers: ["Authorization":"Bearer \(token)"], decodeType: User.self)
    }
}
