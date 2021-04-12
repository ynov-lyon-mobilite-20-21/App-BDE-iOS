//
//  StripePaymentWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation

struct StripePaymentResponse: Decodable {
    var paymentIntentId: String
    var clientSecret: String
}

class StripePaymentWebService: WebService {
    
    typealias DecodedType = StripePaymentResponse
    typealias ServiceParameters = EmptyParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/events/pay/%@"
    
    var httpMethod: HTTPMethod = .POST
    
    var headers: [String : String] = [:]
}
