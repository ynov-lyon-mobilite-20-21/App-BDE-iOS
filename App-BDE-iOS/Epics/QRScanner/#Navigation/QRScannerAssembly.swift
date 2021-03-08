//
//  QRScannerAssembly.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/03/2021.
//

import Swinject
import SwinjectAutoregistration

final class QRScannerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(QRScannerViewModel.self) { r -> QRScannerViewModel in
            let viewModel = QRScannerViewModel()
            viewModel.qrScannerWebService = r.resolve(QRScannerWebService.self)
            return viewModel
        }
        
        container.register(QRScannerView.self) { r -> QRScannerView in
            let viewModel = r.resolve(QRScannerViewModel.self)!
            
            return QRScannerView(viewModel: viewModel)
        }
    }
}
