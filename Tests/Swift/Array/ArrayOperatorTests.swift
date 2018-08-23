//
//  ArrayOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/28.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayOperatorTests: XCTestCase {
    
    func testOrOperator() {
        XCTAssertEqual(["hello", "world"] | ["!"], ["hello", "world", "!"])
    }
    
    func testSubtractionOperator() {
        XCTAssertEqual(["hello"] - ["world"], ["hello"])
        XCTAssertEqual(["hello"] - ["hello", "world"], [])
        XCTAssertEqual(["hello"] - [], ["hello"])
        XCTAssertEqual(["hello", "world"] - ["world"], ["hello"])
    }
    
    func testSubtractionAssignmentOperator() {
        var hello = ["hello", "world"]
        hello -= ["world"]
        XCTAssertEqual(hello, ["hello"])
        hello -= []
        XCTAssertEqual(hello, ["hello"])
        hello -= ["hello", "world"]
        XCTAssertEqual(hello, [])
    }
    
    func testAndOperator() {
        XCTAssertEqual(["hello"] & ["world"], [])
        XCTAssertEqual(["hello"] & ["hello", "world"], ["hello"])
        XCTAssertEqual(["hello"] & [], [])
    }
    
}
