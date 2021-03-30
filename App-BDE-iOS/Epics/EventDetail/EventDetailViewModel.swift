//
//  EventDetailViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 28/03/2021.
//

import Foundation

class EventDetailViewModel: BaseViewModel {
    
    func setup(event: Event) {
        self.event = event
    }
    var event: Event!
    
}
