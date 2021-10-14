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
                XCTAssertEqual(events[0].title, "Liverpool v Porto")
                XCTAssertEqual(events[0].subtitle, "UEFA Champions League")
                XCTAssertEqual(events[0].date, "2021-10-14T01:31:35.989Z")
                XCTAssertEqual(events[0].imageUrl, "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20")
                XCTAssertEqual(events[0].videoUrl, "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/promo.mp4?alt=media")
            case .failure:
                XCTFail("Expected success")
            }
        }
    }
    func testFetchImageFailure() {
        networking.state = .error(NetworkingError.noData)
        manager.getEvents { result in
            switch result {
                case .success:
                    XCTFail("Expected failure")
                case .failure(let error):
                    XCTAssertEqual(error, .noData)
            }
        }
        
    }
  
}
