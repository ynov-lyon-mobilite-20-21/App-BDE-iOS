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
        container.register(EventViewModel.self) { r -> EventViewModel in
            let viewModel = EventViewModel()
            viewModel.getEventWebService = r.resolve(GetEventWebService.self)
            return viewModel
        }

        container.register(EventView.self) { r -> EventView in
            let viewModel = r.resolve(EventViewModel.self)!

            return EventView(viewModel: viewModel)
        }
    }
}
