//
//  QRScannerWebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 07/03/2021.
//

import Foundation
import Combine

struct QRScannerWebServiceParameters: Encodable {}

final class QRScannerWebService: WebService {
    
    typealias DecodedType = Ticket
    typealias ServiceParameters = QRScannerWebServiceParameters
    
    var url: URL? = URL(string: "https://lyon-ynov-bde-api.herokuapp.com/api/ticket/")
    var httpMethod: HTTPMethod = .GET
    var headers: [String : String]? = [:]
    
}
