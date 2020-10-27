//
//  Event.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import Foundation

struct Event: Identifiable {
    let id: Int?
    let name: String?
    let type: String?
    let image: String?
    let date: String?
    let address: String?
    let description: String?
    let price: Int?
    
    init() {
        
    }
}
