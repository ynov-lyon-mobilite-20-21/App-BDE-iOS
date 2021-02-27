//
//  QRCodeView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 27/02/2021.
//

import SwiftUI

struct QRCodeView: View {
    @ObservedObject var viewModel: QRCodeViewModel
    
    var body: some View {
        ZStack {
            Image("QR-FOOD")
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .center) {
                Image(uiImage: viewModel.generateQRCode(from: "test"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .cornerRadius(16)
                    .padding(7)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.bdePink, .bdeGreen]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
        }
        .ignoresSafeArea()
        .background(Color.bdeBlue)
        .ignoresSafeArea()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(viewModel: QRCodeViewModel())
    }
}
