//
//  AnyPublisher+Extensions.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 05/01/2021.
//

import Combine

extension AnyPublisher {
    static func empty() -> AnyPublisher {
        return AnyPublisher(Empty())
    }
}
