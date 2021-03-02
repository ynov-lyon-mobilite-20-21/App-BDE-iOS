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
    
    var body: some View {
        CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson") { result in
            switch result {
            case .success(let code):
                print("Found code: \(code)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView(viewModel: QRScannerViewModel())
    }
}
