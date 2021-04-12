//
//  GetCreditsCards.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation

class GetCreditsCardsWebService: WebService {
    
    typealias DecodedType = [CreditCard]
    typealias ServiceParameters = EmptyParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/stripe/credit-cards/me"
    
    var httpMethod: HTTPMethod = .GET
    
    var headers: [String : String] = [:]
}
