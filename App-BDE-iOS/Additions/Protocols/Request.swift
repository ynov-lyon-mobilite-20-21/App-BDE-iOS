//
//  Request.swift
//  FYD
//
//  Created by Maxence Mottard on 30/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation
import Combine



enum HTTPMethod: String {
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

protocol Request {}

extension Request {
    
    func request<T: Decodable>(
        _ url: URL,
        httpMethod: HTTPMethod = .GET,
        headers: [String: String] =  [:],
        body: Encodable? = nil,
        decodeType: T.Type
    ) -> AnyPublisher<T, Error> {
        do {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            
            request.allHTTPHeaderFields = headers
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("cache-control", forHTTPHeaderField: "no-cache")
            
            if let body = body {
                let encodable = AnyEncodable(body)
                request.httpBody = try JSONEncoder().encode(encodable)
            }
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap {(data, response) -> Data in
                    if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                        switch response.statusCode {
                        case 401: throw ApiRequestError.badCredentials
                        default:
                            throw ApiRequestError.unknowError
                        }
                    }
                    return data
                }
                .decode(type: GenericServerResponse<T>.self, decoder: JSONDecoder())
                .map { $0.data }
                .eraseToAnyPublisher()
        } catch let error {
            return AnyPublisher(Fail(error: error))
        }
    }
}

enum ApiRequestError: String, Error {
    typealias RawValue = String
    
    case unknowError = "Une erreur est apparue"
    case badCredentials = "Votre mail ou votre mot de passe est incorrect"
}
