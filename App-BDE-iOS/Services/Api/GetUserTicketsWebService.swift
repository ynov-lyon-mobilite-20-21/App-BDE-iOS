//
//  GetUserTicketsWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/04/2021.
//

import Foundation

class GetUserTicketsWebService: WebService {
    
    typealias DecodedType = [Ticket]
    typealias ServiceParameters = EmptyParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/tickets/me"
    
    var httpMethod: HTTPMethod = .GET
    
    var headers: [String : String] = [:]
}
