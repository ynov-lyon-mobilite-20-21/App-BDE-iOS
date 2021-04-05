//
//  GetUserWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 09/03/2021.
//

import Foundation

class GetUserWebService: WebService {
    
    typealias DecodedType = User
    typealias ServiceParameters = EmptyParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/users/me"
    
    var httpMethod: HTTPMethod = .GET
    
    var headers: [String : String] = [:]
}
