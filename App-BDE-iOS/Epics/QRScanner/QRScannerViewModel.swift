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
    var ticketOwner: String = "" {
        didSet {
            objectWillChange.send()
        }
    }
    var ticketId: String = "" {
        didSet {
            objectWillChange.send()
        }
    }
    var isScanning: Bool = true {
        didSet {
            objectWillChange.send()
        }
    }
    var event: Event!

    func scanQRCode(_ qrCodeValue: String) {
        isScanning.toggle()
        guard qrCodeValue.contains("bde_") else {
            return
        }
        var qrCodeValue = QRScanDTO(qrCodeValue: qrCodeValue)
        qrCodeValue.qrCodeValue = qrCodeValue.qrCodeValue.deletingPrefix("bde_")
        
        let serviceParameters = ExecuteServiceSetup(service: qrScannerWebService,
                                                    parameters: EmptyParameters(),
                                                    urlParameters: [qrCodeValue.qrCodeValue],
                                                    isRequestAuthenticated: true)

        executeRequest(serviceParameters, onSuccess: { value in
            self.ticketOwner = value.data.user.firstName
            self.ticketId = value.data.ticket._id
            print(value.data.user.mail)
        }, onError: { error in
            print(error)
        })
    }
    
    func scanAgain() {
        isScanning.toggle()
    }
}
