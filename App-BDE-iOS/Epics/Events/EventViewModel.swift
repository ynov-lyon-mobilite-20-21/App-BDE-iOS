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
    var getEventWebService: GetEventWebService!
    var eventList: [Event] = [] {
        didSet {
            objectWillChange.send()
        }
    }
    
    func requestEvents() {
       let serviceParameters = ExecuteServiceSetup(service: getEventWebService, parameters: EmptyParameters())
       
       executeRequest(serviceParameters, onSuccess: weakify { strongSelf, events in
        print(events.data)
        DispatchQueue.main.async {
            strongSelf.eventList = events.data
        }
       }, onError: { error in
        print(error)
    })
   }
}
