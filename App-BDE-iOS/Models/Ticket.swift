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
    var paymentId: String?
    var validationCount: Int
    var qrCodeString: String
}
