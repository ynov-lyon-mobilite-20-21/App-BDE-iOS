//
//  UserDTO.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/11/2020.
//

import Foundation

struct SignUpDTO: Encodable, Decodable {
    var mail: String
    var password: String
    var firstName: String
    var lastName: String
    var formation: String
    var promotion: String
    var pictureUrl: String
}
