//
//  QRCodeAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/02/2021.
//

import Swinject
import SwinjectAutoregistration

final class QRCodeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(QRCodeViewModel.self) { r -> QRCodeViewModel in
            return QRCodeViewModel()
        }
        
        container.register(QRCodeView.self) { r -> QRCodeView in
            let viewModel = r.resolve(QRCodeViewModel.self)!
            
            return QRCodeView(viewModel: viewModel)
        }
    }
}
