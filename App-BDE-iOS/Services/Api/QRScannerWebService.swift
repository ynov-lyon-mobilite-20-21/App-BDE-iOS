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
    typealias ServiceParameters = EmptyParameters

    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/ticket/%@/check"
    var httpMethod: HTTPMethod = .GET
    var headers: [String : String] = [:]
    
}
