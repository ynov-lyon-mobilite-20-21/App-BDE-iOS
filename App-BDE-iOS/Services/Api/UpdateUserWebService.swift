//
//  UpdateUserWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/04/2021.
//

import Foundation

struct UpdateUserWebServiceParameters: Encodable {
    var mail: String
    var password: String
    var firstName: String
    var lastName: String
    var promotion: Promotion
    var formation: Formation
}

class UpdateUserWebService: WebService {
    
    typealias DecodedType = User
    typealias ServiceParameters = UpdateUserWebServiceParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/users"
    
    var httpMethod: HTTPMethod = .PUT
    
    var headers: [String : String] = [:]
}
