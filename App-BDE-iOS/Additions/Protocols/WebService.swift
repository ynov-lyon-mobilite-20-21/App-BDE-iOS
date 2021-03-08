//
//  WebService.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 05/01/2021.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case POST
    case GET
    case PUT
    case DELETE
}

enum WebServiceDataType {
    case JSON
}

protocol WebService: Weakable {
    associatedtype DecodedType: Decodable
    associatedtype ServiceParameters: Encodable

    var url: String { get set }
    var httpMethod: HTTPMethod { get set }
    var headers: [String: String] { get set }
}

extension WebService {

    private func encodeBody(parameters: ServiceParameters) throws -> Data {
        let encodable = AnyEncodable(parameters)
        return try JSONEncoder().encode(encodable)
    }

    private func generateHeaders() -> [String: String] {
        headers["content-type"] = "application/json"
        headers["no-cache"] = "cache-control"

        return headers
    }

    private func generateRequest(_ parameters: ServiceParameters, urlParameters: [String]) throws -> URLRequest? {
        let urlString = String(format: url, arguments: urlParameters)
        guard let url = URL(string: urlString) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if !(parameters is EmptyParameters) {
            request.httpBody = try encodeBody(parameters: parameters)
        }
        for (key, value) in generateHeaders() {
            request.addValue(value, forHTTPHeaderField: key)
        }

        return request
    }

    func call(_ parameters: ServiceParameters, urlParameters: [String]) -> AnyPublisher<GenericServerResponse<DecodedType>, Error> {
        do {
            guard let request = try generateRequest(parameters, urlParameters: urlParameters) else { return AnyPublisher.empty() }

            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap {(data, response) -> Data in
                    if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                        let errorData = try JSONDecoder().decode(GenericErrorResponse.self, from: data)
                        throw ViewError(errorCode: ViewError.ErrorCode(rawValue: errorData.error.code) ?? .UNKNOW_ERROR)
                    }
                    return data
                }
                .decode(type: GenericServerResponse<DecodedType>.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch let error {
            return AnyPublisher(Fail(error: error))
        }
    }

    func callWithoutDecode(_ parameters: ServiceParameters, urlParameters: [String]) -> AnyPublisher<Void, Error> {
        do {
            guard let request = try generateRequest(parameters, urlParameters: urlParameters) else { return AnyPublisher.empty() }

            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { _ in return }
                .eraseToAnyPublisher()
        } catch let error {
            return AnyPublisher(Fail(error: error))
        }
    }

    func addHeader(key: String, value: String) {
        headers[key] = value
    }
}

extension WebService where ServiceParameters == EmptyParameters {

    func call(urlParameters: [String]) -> AnyPublisher<GenericServerResponse<DecodedType>, Error> {
        return call(EmptyParameters(), urlParameters: urlParameters)
    }

    func callWithoutDecode(urlParameters: [String]) -> AnyPublisher<Void, Error> {
        return callWithoutDecode(EmptyParameters(), urlParameters: urlParameters)
    }
}

 struct EmptyParameters: Encodable {}
