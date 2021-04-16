//
//  StripePaymentWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation

struct StripePaymentResponse: Decodable {
    var basicPaymentFallback: Bool
    var paymentIntentId: String
    var clientSecret: String
    var payLink: String
}

struct StripePaymentParameters: Encodable {
    var basicPaymentFallback: Bool
}

class StripePaymentWebService: WebService {
    
    typealias DecodedType = StripePaymentResponse
    typealias ServiceParameters = StripePaymentParameters
    
    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/events/pay/%@"
    
    var httpMethod: HTTPMethod = .POST
    
    var headers: [String : String] = [:]
}
