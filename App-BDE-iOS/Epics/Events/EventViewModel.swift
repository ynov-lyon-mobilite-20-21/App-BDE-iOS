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
    var eventList: [Event] = [] {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    var isLoading: Bool = true {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    func requestEvents() {
       let serviceParameters = ExecuteServiceSetup(service: getEventWebService, parameters: EmptyParameters())
       
       executeRequest(serviceParameters, onSuccess: weakify { strongSelf, events in
        DispatchQueue.main.async {
            strongSelf.eventList = events.data
            self.isLoading = false
        }
       }, onError: { error in
        print(error)
    })
   }
}
