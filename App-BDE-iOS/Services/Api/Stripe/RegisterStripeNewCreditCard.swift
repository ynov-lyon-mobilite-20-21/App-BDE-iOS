//
//  RegisterStripeNewCreditCard.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation

struct StripeCreditCard: Decodable {
    var id: String
    var object: String
    var address_city: String?
    var address_country: String?
    var address_line1: String?
    var address_line1_check: String?
    var address_line2: String?
    var address_state: String?
    var address_zip: String?
    var address_zip_check: String?
    var brand: String
    var country: String
    var cvc_check: String
    var dynamic_last4: String?
    var exp_month: Int
    var exp_year: Int
    var funding: String
    var last4: String
    var name: String
    var tokenization_method: String?
}

struct RegisterStripeNewCreditCardResponse: Decodable {
    
    var id: String
//    var object: String
//    var card: StripeCreditCard
//    var client_ip: String
//    var created: Int
//    var livemode: Bool
//    var type: String
//    var used: Bool

}

struct RegisterStripeNewCreditCardParameters: Encodable, DictionaryConvertor {
    var number: String
    var exp_month: String
    var exp_year: String
    var cvc: String
    var name: String
}

protocol DictionaryConvertor {
    func toDictionary() -> [String : Any]
}

extension DictionaryConvertor {
    
    func toDictionary() -> [String : Any] {
        let reflect = Mirror(reflecting: self)
        let children = reflect.children
        let dictionary = toAnyHashable(elements: children)
        return dictionary
    }
    
    private func toAnyHashable(elements: AnyCollection<Mirror.Child>) -> [String : Any] {
        var dictionary: [String : Any] = [:]
        for element in elements {
            if let key = element.label {
                
                if let collectionValidHashable = element.value as? [AnyHashable] {
                    dictionary[key] = collectionValidHashable
                }
                
                if let validHashable = element.value as? AnyHashable {
                    dictionary[key] = validHashable
                }
                
                if let convertor = element.value as? DictionaryConvertor {
                    dictionary[key] = convertor.toDictionary()
                }
                
                if let convertorList = element.value as? [DictionaryConvertor] {
                    dictionary[key] = convertorList.map({ e in
                        e.toDictionary()
                    })
                }
            }
        }
        return dictionary
    }
}

class RegisterStripeNewCreditCard: WebService {
    
    typealias DecodedType = RegisterStripeNewCreditCardResponse
    typealias ServiceParameters = RegisterStripeNewCreditCardParameters
    
    var url: String = "https://api.stripe.com/v1/tokens"
    
    var httpMethod: HTTPMethod = .POST
    
    var headers: [String : String] = [:]
}
