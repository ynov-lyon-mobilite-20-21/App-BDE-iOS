//
//  CreateNewStripeCreditCard.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 12/04/2021.
//

import Foundation

struct StripeIDServiceParameters: Encodable {
    var stripeId: String
}

class CreateNewStripeCreditCardWebService: WebService {
    
    typealias DecodedType = CreditCard
    typealias ServiceParameters = StripeIDServiceParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/stripe/credit-cards"
    
    var httpMethod: HTTPMethod = .POST
    
    var headers: [String : String] = [:]
}
