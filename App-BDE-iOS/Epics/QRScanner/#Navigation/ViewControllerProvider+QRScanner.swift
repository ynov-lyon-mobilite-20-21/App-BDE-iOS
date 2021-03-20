//
//  ViewControllerProvider+QRScanner.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/03/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func QRScanner() -> QRScannerView {
        let assembler = generateAssembler(viewControllerAssembly: QRScannerAssembly())

        return assembler.resolver.resolve(QRScannerView.self)!
    }
}
