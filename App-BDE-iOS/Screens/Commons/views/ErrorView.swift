//
//  ErrorView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/12/2020.
//

import SwiftUI

struct ErrorView: View {
    var error: String
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            VStack {
                Text(error)
            }
            .background(Color.whiteToBlue)
            .frame(width: 200, height: 200)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "")
    }
}
