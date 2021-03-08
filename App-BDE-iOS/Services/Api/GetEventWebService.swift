//
//  GetEventWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 14/03/2021.
//

import Foundation

final class GetEventWebService: WebService {
    
    typealias DecodedType = Event
    typealias ServiceParameters = EmptyParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/events"
    
    var httpMethod: HTTPMethod = .GET
    
    var headers: [String : String] = [:]
}
