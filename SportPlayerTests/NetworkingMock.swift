//
//  NetworkingMock.swift
//  SportPlayerTests
//
//  Created by Lukasz Dziwosz on 14/10/2021.
//

import XCTest
@testable import SportPlayer

class NetworkingMock: XCTestCase, NetworkingProtocol {
    
    enum State {
        case success
        case error(NetworkingError)
    }

    var state: State = .success
    
    func request<T>(_ type: T.Type, requestProvider: RequestProviding, completion: @escaping NetworkCompletion<T>) {
        switch state {
        case .success:
            let data = mockContentData
            let decoder = JSONDecoder()
            let events = try! decoder.decode([Event].self, from: data)
            guard let model = events as? T else { completion { throw NetworkingError.noData }; return }
            completion { model }
        case .error(let error):
            completion {throw error}
       
        }
        
    }
    



}
