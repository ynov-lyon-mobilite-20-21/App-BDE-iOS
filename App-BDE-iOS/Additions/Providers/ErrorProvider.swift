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
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

    var hasError: Bool = false

    func handleError(_ error: ViewError) {
        self.error = error
    }
}
