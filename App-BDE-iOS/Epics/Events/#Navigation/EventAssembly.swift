//
//  EventAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class EventAssembly: Assembly {
    func assemble(container: Container) {
//        container.autoregister(EventViewModel.self, initializer: EventViewModel.init)
        container.register(EventViewModel.self) { r -> EventViewModel in
            return EventViewModel()
        }
        
        container.register(EventView.self) { r -> EventView in
            let viewModel = r.resolve(EventViewModel.self)!
            
            return EventView(viewModel: viewModel)
        }
    }
}
