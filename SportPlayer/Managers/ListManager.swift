//
//  EventListManager.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 10/10/2021.
//

import UIKit
//import Kingfisher

typealias FetchEventsCompletion<T: Decodable> = (Result<T, NetworkingError>) -> Void
//typealias FetchImageCompletion = (UIImage?) -> Void

protocol ListManagerProtocol {
    func getEvents(_ completion: @escaping FetchEventsCompletion<[Event]>)
    func getSchedules(_ completion: @escaping FetchEventsCompletion<[Schedule]>)
//    func retrieveImage(for event: Event, completion: @escaping FetchImageCompletion)
}

final class ListManager: ListManagerProtocol {

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
    func getSchedules(_ completion: @escaping FetchEventsCompletion<[Schedule]>) {
        provider.request([Schedule].self, requestProvider: Endpoint.schedule) { [weak self] response in
            guard let self = self else { return }
            do {
                let result = try response()
                completion(.success(result))
            } catch {
                completion(.failure(self.handleError(error)))
            }
        }
    }
    // TODO move Kingfisher out of controller
//    func retrieveImage(for event: Event, completion: @escaping FetchImageCompletion) {
//        guard let urlString = event.imageUrl, let url = URL(string: urlString) else {
//            completion(nil)
//            return
//        }
//
//        let imageResource = ImageResource(downloadURL: url, cacheKey: event.id)
//
//        KingfisherManager.shared.retrieveImage(with: imageResource) { result in
//            switch result {
//            case .success(let retrievedImage):
//                completion(retrievedImage.image)
//            case .failure:
//                completion(nil)
//            }
//        }
//    }
    private func handleError(_ error: Error) -> NetworkingError {
        guard let apiError = error as? NetworkingError else { return .invalidResponse }
        return apiError
    }

}
