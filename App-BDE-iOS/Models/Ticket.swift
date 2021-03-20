//
//  Ticket.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/02/2021.
//

import Foundation

struct Ticket: Decodable {
    var id: String
    var eventId: String
    var eventName: String
    var ownerId: String
    var buyerFirstName: String
    var buyerName: String

}
