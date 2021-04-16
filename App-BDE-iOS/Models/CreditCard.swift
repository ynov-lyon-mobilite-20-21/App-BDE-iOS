//
//  CreditCard.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 11/04/2021.
//

import Foundation

struct CreditCard: Decodable, Equatable {

    var _id: String
    var isDefaultCard: Bool
    var stripeId: String
    var userId: String
    var name: String
    var last4: String
    var expMonth: Int
    var expYear: Int
    var brand: String
}
