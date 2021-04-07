//
//  Ticket.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/02/2021.
//

import Foundation

struct Ticket: Decodable {
    var _id: String
    var eventId: String
    var userId: String
    var isValid: Bool
    var validationCount: Int
    var paymentId: String?
    // add qrCodeString: String
}
