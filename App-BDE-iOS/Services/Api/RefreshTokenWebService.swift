//
//  TokenWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/03/2021.
//

import Foundation

struct RefreshTokenServiceParameter: Encodable {
    var refreshToken: String
}

class RefreshTokenWebService: WebService {
    typealias DecodedType = AuthToken
    typealias ServiceParameters = RefreshTokenServiceParameter
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/auth/refresh"
    var httpMethod: HTTPMethod = .POST
    var headers: [String : String] = [:]
}
