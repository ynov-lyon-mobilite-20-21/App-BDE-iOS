//
//  DeleteUserWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 06/04/2021.
//

import Foundation

struct ServerResponse: Decodable {
}

final class DeleteUserWebService: WebService {
    
    typealias DecodedType = ServerResponse
    typealias ServiceParameters = EmptyParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/users"
    
    var httpMethod: HTTPMethod = .DELETE
    
    var headers: [String : String] = [:]
}
