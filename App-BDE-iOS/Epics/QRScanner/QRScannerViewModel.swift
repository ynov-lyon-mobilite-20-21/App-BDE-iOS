//
//  QRScannerViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/03/2021.
//

import Foundation

class QRScannerViewModel: BaseViewModel {
    
    @Published var ticketOwner: String = ""
    @Published var ticketId: String = ""
    
    public func scanQRCode(_ qrCodeValue: String) {
        let qrCodeValue = QRScanDTO(qrCodeValue: qrCodeValue)
        let qrScannerWebService = QRScannerWebService()
        executeRequest(qrScannerWebService.call(qrCodeValue), onSuccess: { value in
            print(value.data.buyerName)
        })
        
    }
}
