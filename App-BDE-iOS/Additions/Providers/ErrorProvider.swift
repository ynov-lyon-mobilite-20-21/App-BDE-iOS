//
//  ErrorProvider.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 17/02/2021.
//

import SwiftUI

class ErrorProvider: ObservableObject, Weakable {

    static var shared = ErrorProvider()

    var error: ViewError? {
        didSet {
            hasError = (error != nil)
            objectWillChange.send()
        }
    }

    var hasError: Bool = false

    func handleError(_ error: ViewError) {
        self.error = error
    }
}
