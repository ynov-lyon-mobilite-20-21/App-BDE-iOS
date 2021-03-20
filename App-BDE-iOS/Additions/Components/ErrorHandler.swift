//
//  ErrorHandler.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 17/02/2021.
//

import SwiftUI

struct ErrorHandler<A: View>: View {

    @ObservedObject var errorProvider = ErrorProvider.shared
    let childView: A

    init(_ childView: () -> (A)) {
        self.childView = childView()
    }

    var body: some View {
        childView
            .alert(item: $errorProvider.error, content: { (error: ViewError) -> Alert in
                Alert(title: Text(error.title), message: Text(error.description), dismissButton: .default(Text(L10n.Error.Alert.Button.cancel)))
            })
    }
}
