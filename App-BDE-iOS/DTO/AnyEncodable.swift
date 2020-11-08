//
//  AnyEncodable.swift
//  FYD
//
//  Created by Maxence Mottard on 16/09/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

struct AnyEncodable: Encodable {

    private let encodable: Encodable

    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }

    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
