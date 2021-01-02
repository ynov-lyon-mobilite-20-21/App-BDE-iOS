//
//  GenericServerResponse.swift
//  FYD
//
//  Created by Maxence Mottard on 16/09/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

class GenericServerResponse<T: Decodable>: Decodable {
    let data: T
}
