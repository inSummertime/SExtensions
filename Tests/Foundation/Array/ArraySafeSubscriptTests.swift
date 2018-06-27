//
//  ArraySafeSubscriptTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArraySafeSubscriptTests: XCTestCase {
    
    func testSafeSubscript() {
        XCTAssertNil(["hello"][safe: 1])
        XCTAssertEqual(["hello", "world"][safe: 1]!, "world")
    }
    
    func testSafeSubscriptCountableRange() {
        let array = ["hello", "world", "!"]
        XCTAssertNil(array[safe: -10..<(-1)])
        XCTAssertNil(array[safe: 10..<11])
        XCTAssertEqual(array[safe: 0..<1]!, ["hello"])
        XCTAssertEqual(array[safe: -1..<1]!, ["hello"])
        XCTAssertEqual(array[safe: 1..<2]!, ["world"])
        XCTAssertEqual(array[safe: 1..<3]!, ["world", "!"])
        XCTAssertEqual(array[safe: 1..<4]!, ["world", "!"])
        XCTAssertEqual(array[safe: 1..<1]!, [])
        let emptyArray: [String] = []
        XCTAssertNil(emptyArray[safe: -10..<(-1)])
        XCTAssertNil(emptyArray[safe: 10..<11])
        XCTAssertNil(emptyArray[safe: 1..<2])
        XCTAssertNil(emptyArray[safe: 1..<4])
    }
    
    func testSafeSubscriptCountableClosedRange() {
        let array = ["hello", "world", "!"]
        XCTAssertNil(array[safe: -10...(-1)])
        XCTAssertNil(array[safe: 10...11])
        XCTAssertEqual(array[safe: 0...1]!, ["hello", "world"])
        XCTAssertEqual(array[safe: -1...1]!, ["hello", "world"])
        XCTAssertEqual(array[safe: 1...2]!, ["world", "!"])
        XCTAssertEqual(array[safe: 1...3]!, ["world", "!"])
        XCTAssertEqual(array[safe: 1...4]!, ["world", "!"])
        XCTAssertEqual(array[safe: 1...1]!, ["world"])
        let emptyArray: [String] = []
        XCTAssertNil(emptyArray[safe: -10...(-1)])
        XCTAssertNil(emptyArray[safe: 10...11])
        XCTAssertNil(emptyArray[safe: 1...2])
        XCTAssertNil(emptyArray[safe: 1...4])
    }
    
}
