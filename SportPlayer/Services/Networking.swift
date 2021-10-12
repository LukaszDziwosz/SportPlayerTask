//
//  APIClient.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import Foundation

enum NetworkingError: Error {
    case noData
    case invalidResponse
    case decodeError
}

typealias NetworkCompletion<T: Decodable> = (() throws ->  T) -> Void

protocol NetworkingProtocol {

    func request<T: Decodable>(_ type: T.Type, requestProvider: RequestProviding, completion: @escaping NetworkCompletion<T>)
}

struct Networking: NetworkingProtocol {

    func request<T: Decodable>(_ type: T.Type, requestProvider: RequestProviding, completion: @escaping NetworkCompletion<T>) {
        
        let urlRequest = requestProvider.urlRequest
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, _ in
            guard let response = urlResponse, let data = data else {
                completion { throw NetworkingError.noData }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                completion { throw NetworkingError.invalidResponse }
                return
            }

            do {
                let parsedObject = try JSONDecoder().decode(T.self, from: data)
                completion { parsedObject }
            } catch {
                completion { throw NetworkingError.decodeError }
            }

        }.resume()
    }
}


