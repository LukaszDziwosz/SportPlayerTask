//
//  ListManagerTest.swift
//  SportPlayerTests
//
//  Created by Lukasz Dziwosz on 14/10/2021.
//

import XCTest
@testable import SportPlayer

class ListManagerTest: XCTestCase {
    
    private var networking: NetworkingMock!
    private var manager: ListManagerProtocol!
    
    override func setUp() {
        networking = NetworkingMock()
        manager = ListManager(provider: networking)
    }

    override func tearDown() {
        manager = nil
        networking = nil
    }
    func testFetchEventsSuccess() {
        manager.getEvents() { result in
            switch result {
            case .success(let events):
                XCTAssertEqual(events.count, 16)
                XCTAssertEqual(events[0].id, "1")
                
            case .failure:
                XCTFail("Expected success")
            }
        }
    }
  
}
