//
//  ViewControllerProvider+EventDetail.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func eventDetail() -> EventDetailView {
        let assembler = generateAssembler(viewControllerAssembly: EventDetailAssembly())
        
        return assembler.resolver.resolve(EventDetailView.self)!
    }
}
