//
//  ViewProvider.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 17/02/2021.
//

import Swinject
import SwiftUI

class ViewProvider: ObservableObject {
    var entrypoint: Entrypoint? {
        didSet {
            objectWillChange.send()
        }
    }

    static var shared = ViewProvider()

    static func generateAssembler(viewControllerAssembly: Assembly) -> Assembler {
        return Assembler([viewControllerAssembly, HelperAssembly()])
    }

    func setEntrypoint(_ entrypoint: Entrypoint) {
        self.entrypoint = entrypoint
    }

    enum Entrypoint {
        case party(partyId: String),
             home
    }
}
