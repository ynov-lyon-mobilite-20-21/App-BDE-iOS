//
//  GenericErrorResponse.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/01/2021.
//

import Foundation

struct GenericErrorResponse: Decodable {
    var error: ServerError
}

struct ServerError: Decodable {
    var code: String
}
