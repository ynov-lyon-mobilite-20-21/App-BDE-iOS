//
//  Token.swift
//  FYD
//
//  Created by Maxence Mottard on 17/09/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

struct AuthToken: Decodable {
    var token: String
    var refreshToken: String
}
