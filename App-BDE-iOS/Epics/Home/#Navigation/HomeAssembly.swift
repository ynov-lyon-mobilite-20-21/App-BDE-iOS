//
//  HomeAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { r -> HomeViewModel in
            return HomeViewModel()
        }
        
        container.register(HomeView.self) { r -> HomeView in
            let viewModel = r.resolve(HomeViewModel.self)!
            
            return HomeView(viewModel: viewModel)
        }
    }
}
