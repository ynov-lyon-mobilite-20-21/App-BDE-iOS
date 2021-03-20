//
//  EventViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/10/2020.
//

import Foundation
import SwiftUI

class EventViewModel: BaseViewModel {

    @Published var show = false
    var event: Event!

    func setup(event: Event) {
        self.event = event
    }

    enum EventType {
        case food
        case party
        case sport
    }
}
