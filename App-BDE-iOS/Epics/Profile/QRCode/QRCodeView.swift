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
        GeometryReader { gr in
            ZStack {
                Color.bdeBlue
                Image("QR-FOOD")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack {
                    Text("Nom de l'évènement")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Text("Numéro du billet")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)

                    ZStack {
                        Image(uiImage: viewModel.generateQRCode(from: viewModel.ticket.qrCodeString))
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                            .frame(width: gr.size.width * 0.7, height: gr.size.width * 0.7)
                            .cornerRadius(24)
                            .padding(10)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [.bdePink, .bdeGreen]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)

                    Text("Nom du propriétaire")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(4)
                    Text(L10n.QRCode.indication)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .background(Color.bdeBlue)
                }
                .frame(width: gr.size.width)
            }
            .frame(width: gr.size.width)
            .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(viewModel: QRCodeViewModel())
    }
}
