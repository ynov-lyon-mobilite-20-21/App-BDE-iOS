//
//  EventDetailAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class EventDetailAssembly: Assembly {
    func assemble(container: Container) {
//        container.autoregister(EventViewModel.self, initializer: EventViewModel.init)
        container.register(EventViewModel.self) { r -> EventViewModel in
            return EventViewModel()
        }
        
        container.register(EventDetailView.self) { r -> EventDetailView in
            let viewModel = r.resolve(EventViewModel.self)!
            
            return EventDetailView(viewModel: viewModel)
        }
    }
}
