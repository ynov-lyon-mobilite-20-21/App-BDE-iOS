//
//  Payment.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 05/04/2021.
//

import Foundation

struct Payment: Decodable {
    var buyOn: String
    var amount: String
    var paymentStatus: String
}
