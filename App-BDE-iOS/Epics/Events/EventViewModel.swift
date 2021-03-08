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

    @Published var show = false
    var event: Event!

    func setup(event: Event) {
        self.event = event
    }
    
    func requestEvents() {
       let serviceParameters = ExecuteServiceSetup(service: getEventWebService, parameters: EmptyParameters())
       
       executeRequest(serviceParameters, onSuccess: { value in
           print(value)
       }, onError: { error in
        print(error)
    })
   }
}
