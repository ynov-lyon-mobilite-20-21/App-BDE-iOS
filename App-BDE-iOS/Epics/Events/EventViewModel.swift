//
//  EventViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/10/2020.
//

import Foundation
import SwiftUI

class EventViewModel: BaseViewModel {
    
    @Published var selectedItem = Event(id: "", name: "", type: .defaultValue, image: .defaultValue, date: "", address: "", description: "", price: 0)
    
    @Published var show = false
    
    
    enum eventType {
        case food
        case party
        case sport
    }
}
