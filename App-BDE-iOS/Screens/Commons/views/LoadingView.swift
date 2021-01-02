//
//  LoadingView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 30/12/2020.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.bdeYellow))
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
