//
//  ViewControllerProvider+QRCode.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/02/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func QRCode() -> QRCodeView {
        let assembler = generateAssembler(viewControllerAssembly: QRCodeAssembly())

        return assembler.resolver.resolve(QRCodeView.self)!
    }
}
