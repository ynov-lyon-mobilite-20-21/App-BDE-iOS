//
//  EventViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/10/2020.
//

import Foundation
import SwiftUI

class EventViewModel: BaseViewModel {
    
    var getEventWebService: GetEventWebService!
    var event: Event!
    
    @Published var show = false
    var eventList: [Event] = []

    func setup(event: Event) {
        self.event = event
    }
    
    func requestEvents() {
       let serviceParameters = ExecuteServiceSetup(service: getEventWebService, parameters: EmptyParameters())
       
       executeRequest(serviceParameters, onSuccess: { value in
        self.eventList.append(contentsOf: value.data)
       }, onError: { error in
        print(error)
    })
   }
}
