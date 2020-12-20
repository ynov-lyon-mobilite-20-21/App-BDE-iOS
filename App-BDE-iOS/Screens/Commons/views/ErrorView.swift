//
//  ErrorView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/12/2020.
//

import SwiftUI

struct ErrorView: View {
    var vm: Any
    var error: String
    var body: some View {
        VStack {
            Text(error)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(vm: "", error: "")
    }
}
