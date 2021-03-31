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
    var logoType: LogoType
    var date: String
    var hour: String
    var address: String
    var description: String
    var price: Int
    
    init(_id: String, name: String, type: EventType, imgType: ImageType, logoType: LogoType, date: String, hour: String, address: String, description: String, price: Int) {
        self._id = _id
        self.name = name
        self.type = type
        self.imgType = imgType
        self.logoType = logoType
        self.date = date
        self.hour = hour
        self.address = address
        self.description = description
        self.price = price
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        _id = try container.decode(String.self, forKey: ._id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(EventType.self, forKey: .type)
        imgType = try container.decode(ImageType.self, forKey: .imgType)
        logoType = LogoType.from(eventType: type)
        date = Event.convertFrom(date: try container.decode(String.self, forKey: .date))
        hour = Event.convertToHourFrom(date: try container.decode(String.self, forKey: .date))
        address = try container.decode(String.self, forKey: .address)
        description = try container.decode(String.self, forKey: .description)
        price = try container.decode(Int.self, forKey: .price)
    }
    
    enum CodingKeys: String, CodingKey {
        case _id, name, type, imgType, logoType, date, hour, address, description, price
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

    enum LogoType: String, Decodable, CaseIterable {
        case defaultValue = "",
             kolok = "KOLOK_biere",
             party = "PARTY_cocktail",
             lan = "LAN_manette",
             sport = "SPORT_haltere",
             food = "FOOD_stand"
        
        static func from(eventType: EventType) -> LogoType {
            switch eventType {
            case .defaultValue:
                return .defaultValue
            case .kolok:
                return .kolok
            case .studentParty:
                return .party
            case .lan:
                return .lan
            case .sportParty:
                return .sport
            case .foodSelling:
                return .food
            }
        }
    }
    
    static private func convertFrom(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: date) else { return "Date indisponible" }
        
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateStyle = .short
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    static private func convertToHourFrom(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: date) else { return "Heure indisponible" }
        
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
}
