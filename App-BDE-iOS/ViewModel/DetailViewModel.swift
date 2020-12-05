//
//  DetailViewModel.swift
//  App Store
//
//  Created by Balaji on 14/11/20.
//

import SwiftUI

class DetailViewModel: ObservableObject {

    @Published var selectedItem = Event(id: "", name: "", type: .defaultValue, image: .defaultValue, date: "", address: "", description: "", price: 0)
    
    @Published var show = false
}

