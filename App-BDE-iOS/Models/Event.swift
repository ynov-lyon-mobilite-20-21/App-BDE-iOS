//
//  Event.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import Foundation

struct Event: Identifiable, Hashable {
    var id: Int?  = nil
    var name: String?  = nil
    var type: String?  = nil
    var image: String?  = nil
    var date: String?  = nil
    var address: String?  = nil
    var description: String?  = nil
    var price: Int?  = nil
    
    init() {}
    
    init(id: Int, name: String, type: String, image: String, date: String, address: String, description: String, price: Int) {
            self.id = id
            self.name = name
            self.type = type
            self.image = image
            self.date = date
            self.address = address
            self.description = description
            self.price = price
        }
}
