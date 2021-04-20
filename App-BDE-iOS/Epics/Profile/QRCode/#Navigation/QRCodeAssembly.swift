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
        container.register(QRCodeViewModel.self) { (_: Resolver, ticket: Ticket) -> QRCodeViewModel in
            let viewModel = QRCodeViewModel()
            viewModel.setup(ticket: ticket)
            return viewModel
        }

        container.register(QRCodeView.self) { (r: Resolver, ticket: Ticket) -> QRCodeView in
            let viewModel = r.resolve(QRCodeViewModel.self, argument: ticket)!

            return QRCodeView(viewModel: viewModel)
        }
    }
}
