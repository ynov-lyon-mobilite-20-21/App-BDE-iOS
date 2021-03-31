//
//  SignInWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 31/03/2021.
//

import Foundation

final class SignUpWebService: WebService {
    
    typealias DecodedType = User
    typealias ServiceParameters = SignUpDTO
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/users"

    var httpMethod: HTTPMethod = .POST

    var headers: [String: String] = [:]
}
