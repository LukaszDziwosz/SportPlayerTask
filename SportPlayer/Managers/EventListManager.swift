//
//  EventListManager.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 10/10/2021.
//

import Foundation

typealias FetchEventsCompletion<T: Decodable> = (Result<T, NetworkingError>) -> Void

protocol EventListManagerProtocol {
    func getEvents(_ completion: @escaping FetchEventsCompletion<[Event]>)
}

final class EventListManager: EventListManagerProtocol {

    private let provider: NetworkingProtocol
    
    init(provider: NetworkingProtocol = Networking()) {
        self.provider = provider
    }
   
    func getEvents(_ completion: @escaping FetchEventsCompletion<[Event]>) {
        provider.request([Event].self, requestProvider: Endpoint.event) { [weak self] response in
            guard let self = self else { return }
            do {
                let result = try response()
                completion(.success(result))
            } catch {
                completion(.failure(self.handleError(error)))
            }
        }
    }
    private func handleError(_ error: Error) -> NetworkingError {
        guard let apiError = error as? NetworkingError else { return .invalidResponse }
        return apiError
    }

}
