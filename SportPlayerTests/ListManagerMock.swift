//
//  ListManagerMock.swift
//  SportPlayerTests
//
//  Created by Lukasz Dziwosz on 14/10/2021.
//

import UIKit
import XCTest
@testable import SportPlayer

class ListManagerMock: XCTestCase, ListManagerProtocol {

    
    enum State {
        case success
        case failure
    }
    
    var state: State = .success
    
    func getEvents(_ completion: @escaping FetchEventsCompletion<[Event]>) {
        switch state {
        case .success:
            let data = mockContentData
            let decoder = JSONDecoder()
            let events = try! decoder.decode([Event].self, from: data)
            completion(.success(events))
        case .failure:
            completion(.failure(NetworkingError.invalidResponse))
        
        }
    }
    
    func getSchedules(_ completion: @escaping FetchEventsCompletion<[Schedule]>) {
        
    }
    
}
