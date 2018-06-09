//
//  StringSafeSubscriptTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/1.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest

final class StringSafeSubscriptTests: XCTestCase {
    
    func testSafeI() {
        XCTAssertEqual("Hello world!"[safe: 0]!, "H")
        XCTAssertNil("Hello world!"[safe: 77])
        XCTAssertNil("Hello world!"[safe: -1])
        XCTAssertNil(""[safe: 0])
        XCTAssertNil(""[safe: 1])
    }
    
    func testSafeCountableRange() {
        XCTAssertEqual("Hello world!"[safe: 0..<1], "H")
        XCTAssertEqual("Hello world!"[safe: 1..<7], "ello w")
        XCTAssertEqual("Hello world!"[safe: -77..<77], "Hello world!")
        XCTAssertEqual("Hello world!"[safe: 0..<0], "")
        XCTAssertNil("Hello world!"[safe: 77..<777])
        XCTAssertNil("Hello world!"[safe: -777..<(-77)])
        XCTAssertNil(""[safe: 0..<0])
        XCTAssertNil(""[safe: 77..<777])
        XCTAssertEqual("Hello world!"[safe: CountableRange(uncheckedBounds: (lower: 0, upper: 1))], "H")
        XCTAssertNil("Hello world!"[safe: CountableRange(uncheckedBounds: (lower: 77, upper: 78))])
        XCTAssertEqual("Hello world!"[safe: CountableRange(uncheckedBounds: (lower: -1, upper: 0))], "H")
    }
    
    func testSafeCountableClosedRange() {
        XCTAssertEqual("Hello world!"[safe: 0...1], "He")
        XCTAssertEqual("Hello world!"[safe: 1...7], "ello wo")
        XCTAssertEqual("Hello world!"[safe: -77...77], "Hello world!")
        XCTAssertEqual("Hello world!"[safe: 0...0], "H")
        XCTAssertNil("Hello world!"[safe: 77...777])
        XCTAssertNil("Hello world!"[safe: -777...(-77)])
        XCTAssertNil(""[safe: 0...0])
        XCTAssertNil(""[safe: 77...777])
        XCTAssertEqual("Hello world!"[safe: CountableClosedRange(uncheckedBounds: (lower: 0, upper: 1))], "He")
        XCTAssertNil("Hello world!"[safe: CountableClosedRange(uncheckedBounds: (lower: 77, upper: 78))])
        XCTAssertEqual("Hello world!"[safe: CountableClosedRange(uncheckedBounds: (lower: -1, upper: 0))], "H")
        
    }
    
    func testSafeCountablePartialRangeFrom() {
        XCTAssertEqual("Hello world!"[safe: 0...], "Hello world!")
        XCTAssertEqual("Hello world!"[safe: (-77)...], "Hello world!")
        XCTAssertEqual("Hello world!"[safe: 11...], "!")
        XCTAssertNil("Hello world!"[safe: 77...])
        XCTAssertNil(""[safe: 0...])
        XCTAssertNil(""[safe: 77...])
        XCTAssertEqual("Hello world!"[safe: CountablePartialRangeFrom(0)], "Hello world!")
        XCTAssertNil("Hello world!"[safe: CountablePartialRangeFrom(77)])
        XCTAssertEqual("Hello world!"[safe: CountablePartialRangeFrom(-1)], "Hello world!")
    }
    
    func testSafeFrom() {
        XCTAssertEqual("Hello world!"[safeFrom: 0], "Hello world!")
        XCTAssertEqual("Hello world!"[safeFrom: 7], "orld!")
        XCTAssertEqual("Hello world!"[safeFrom: (-7)], "Hello world!")
        XCTAssertNil("Hello world!"[safeFrom: 77])
        XCTAssertNil(""[safeFrom: 0])
        XCTAssertNil(""[safeFrom: 77])
    }
    
    func testSafeTo() {
        XCTAssertEqual("Hello world!"[safeTo: 0], "H")
        XCTAssertNil("Hello world!"[safeTo: (-7)])
        XCTAssertEqual("Hello world!"[safeTo: (7)], "Hello wo")
        XCTAssertEqual("Hello world!"[safeTo: (77)], "Hello world!")
        XCTAssertEqual("Hello world!"[safeTo: (77)], "Hello world!")
        XCTAssertNil(""[safeTo: 0])
        XCTAssertNil(""[safeTo: 77])
    }
    
}
