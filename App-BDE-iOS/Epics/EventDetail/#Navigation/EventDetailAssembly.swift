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
        container.register(EventViewModel.self) { (r: Resolver, event: Event) -> EventViewModel in
            let viewModel = EventViewModel()
            viewModel.setup(event: event)
            return viewModel
        }
        
        container.register(EventDetailView.self) { (r: Resolver, event: Event) -> EventDetailView in
            let viewModel = r.resolve(EventViewModel.self, argument: event)!
            
            return EventDetailView(viewModel: viewModel)
        }
    }
}
