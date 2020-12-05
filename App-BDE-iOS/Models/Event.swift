//
//  Event.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import Foundation
 
struct Event: Identifiable, Hashable, Decodable {
    var id: String
    var name: String
    var type: EventType
    var image: ImageType
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
         kolok = "KOLOK_card",
         party = "b1",
         lan = "LAN_card",
         sport = "SPORT_card",
         food = "FOOD_card"
}
