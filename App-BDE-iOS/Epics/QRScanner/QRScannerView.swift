//
//  QRScannerView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/03/2021.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @ObservedObject var viewModel: QRScannerViewModel
    @Environment(\.presentationMode) var presentation

    var body: some View {
        GeometryReader { gr in
            ZStack {
                Color.bdeBlue
                Image("QR-SOIREE")
                    .resizable()
                    .aspectRatio(contentMode: .fill)

                VStack {
                    Text("Espit Chupitos")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Text(L10n.QRScanner.indication)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                    ZStack {
                        CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson") { result in
                            switch result {
                            case .success(let code):
                                viewModel.scanQRCode(code)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                        .frame(width: gr.size.width * 0.9, height: gr.size.width * 0.9)
                        .cornerRadius(24)
                        .padding(10)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [.bdePink, .bdeGreen]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)

                    Text(viewModel.ticketOwner)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(4)
                    Text(viewModel.ticketId)
                        .font(.title3)
                        .foregroundColor(.white)
                }
                .frame(width: gr.size.width)
            }
            .frame(width: gr.size.width)
        }
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView(viewModel: QRScannerViewModel())
    }
}
