//
//  QRScannerViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/03/2021.
//

import Foundation

class QRScannerViewModel: BaseViewModel {

    func setup(event: Event) {
        self.event = event
    }
    
    var qrScannerWebService: QRScannerWebService!
    @Published var ticketOwner: String = ""
    @Published var ticketId: String = ""
    var event: Event!

    public func scanQRCode(_ qrCodeValue: String) {
        let qrCodeValue = QRScanDTO(qrCodeValue: qrCodeValue)
        
        let serviceParameters = ExecuteServiceSetup(service: qrScannerWebService, parameters: EmptyParameters(), urlParameters: [qrCodeValue.qrCodeValue])

        executeRequest(serviceParameters, onSuccess: { value in
            print(value.data.buyerName)
        })
    }
}
