//
//  API.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import Combine
import Foundation

enum APIError: Error {
    case badRequest
    case generic
    case decodeError

    static func create(from error: Error) -> APIError {
        if error is DecodingError {
            return APIError.decodeError
        } else {
            return APIError.generic
        }
    }
}

enum APIMethod: String {
    case get = "GET"
}

protocol API {
    func get<T: Decodable>(path: String, type: T.Type) -> AnyPublisher<T, APIError>
}

class DefaultAPI: API {

    private let host = "jsonplaceholder.typicode.com"
    private let session: URLSession

    init (session: URLSession = .shared) {
        self.session = session
    }

    func get<T: Decodable>(path: String, type: T.Type) -> AnyPublisher<T, APIError> {
        guard let request = makeRequest(from: path, method: .get) else {
            return Fail(outputType: T.self, failure: .badRequest).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: request)
            .map { $0.0 }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { APIError.create(from: $0) }
            .eraseToAnyPublisher()
    }

    private func makeRequest(from path: String, method: APIMethod) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path

        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }

}
