//
//  XCTestCase.swift
//  SportPlayerTests
//
//  Created by Lukasz Dziwosz on 14/10/2021.
//

import XCTest

extension XCTestCase {
    

    var mockContentData: Data {
        return getData(name: "events")
    }

    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
}
