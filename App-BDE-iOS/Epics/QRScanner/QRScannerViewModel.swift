//
//  QRScannerViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/03/2021.
//

import Foundation

class QRScannerViewModel: BaseViewModel {

    var qrScannerWebService: QRScannerWebService!
    @Published var ticketOwner: String = ""
    @Published var ticketId: String = ""

    public func scanQRCode(_ qrCodeValue: String) {
        let qrCodeValue = QRScanDTO(qrCodeValue: qrCodeValue)
        executeRequest(qrScannerWebService.call(urlParameters: [qrCodeValue.qrCodeValue]), onSuccess: { value in
            print(value.data.buyerName)
        })

    }
}
