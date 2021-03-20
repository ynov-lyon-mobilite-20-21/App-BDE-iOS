//
//  GameRequests.swift
//  FYD
//
//  Created by Maxence Mottard on 30/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation
import Combine

final class GameRequests: Request {

    func getGames() -> AnyPublisher<[Game], Error> {
        guard let url = URL(string: "https://api.fyd.maxencemottard.com/api/v1/games") else {
            return AnyPublisher(Empty())
        }

        return request(url, decodeType: [Game].self)
    }
}
