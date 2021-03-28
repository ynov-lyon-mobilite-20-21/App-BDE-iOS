//
//  Event.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import Foundation
struct Event: Decodable {
    var _id: String
    var name: String
    var type: EventType
    var imgType: ImageType
    var date: String
    var address: String
    var description: String
    var price: Int
}

enum EventType: String, Decodable, CaseIterable {
    case defaultValue = "",
         kolok = "Call Kolok",
         studentParty = "Soirée Etudiante",
         lan = "LAN",
         sportParty = "Un moment sportif",
         foodSelling = "Vente de nourriture"
}

enum ImageType: String, Decodable, CaseIterable {
    case defaultValue = "",
         kolok = "card_KOLOK",
         party = "card_PARTY",
         lan = "card_LAN",
         sport = "card_SPORT",
         food = "card_FOOD"
}
