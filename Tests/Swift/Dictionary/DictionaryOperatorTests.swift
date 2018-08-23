//
//  DictionaryOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/15.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DictionaryOperatorTests: XCTestCase {
    
    func testAdditionOperator() {
        XCTAssertEqual(["hello": 0] + ["world": 1], ["hello": 0, "world": 1])
        XCTAssertEqual(["hello": 0] + ["hello": 1], ["hello": 1])
        XCTAssertEqual(["hello": 0] + ["hello": 1] + ["": 1], ["hello": 1, "": 1])
        XCTAssertEqual([0: 0] + [1: 1], [0: 0, 1: 1])
        XCTAssertEqual([0: 0] + [:], [0: 0])
    }
    
    func testAdditionAssignmentOperator() {
        var hello = ["hello": 0]
        hello += ["world": 1]
        XCTAssertEqual(hello, ["hello": 0, "world": 1])
        hello += ["hello": 1]
        XCTAssertEqual(hello, ["hello": 1, "world": 1])
        hello += ["": 1]
        XCTAssertEqual(hello, ["hello": 1, "world": 1, "": 1])
        hello += [:]
        XCTAssertEqual(hello, ["hello": 1, "world": 1, "": 1])
    }
    
    func testSubtractionOperator() {
        XCTAssertEqual(["hello": 0] - ["world": 1], ["hello": 0])
        XCTAssertEqual(["hello": 0] - ["hello": 0, "world": 1], [:])
        XCTAssertEqual(["hello": 0] - [:], ["hello": 0])
        XCTAssertEqual(["hello": 0, "world": 1] - ["world": 1], ["hello": 0])
    }
    
    func testSubtractionAssignmentOperator() {
        var hello = ["hello": 0, "world": 1]
        hello -= ["world": 1]
        XCTAssertEqual(hello, ["hello": 0])
        hello -= [:]
        XCTAssertEqual(hello, ["hello": 0])
        hello -= ["hello": 0, "world": 1]
        XCTAssertEqual(hello, [:])
    }
    
    func testAndOperator() {
        XCTAssertEqual(["hello": 0] & ["world": 1], [:])
        XCTAssertEqual(["hello": 0] & ["hello": 0, "world": 1], ["hello": 0])
        XCTAssertEqual(["hello": 0] & ["hello": 1, "world": 1], [:])
        XCTAssertEqual(["hello": 0] & [:], [:])
    }
    
    func testOrOperator() {
        XCTAssertEqual(["hello": 0] | ["world": 1], ["hello": 0, "world": 1])
        XCTAssertEqual(["hello": 0] | ["hello": 1], ["hello": 1])
        XCTAssertEqual(["hello": 0] | ["hello": 1] | ["": 1], ["hello": 1, "": 1])
        XCTAssertEqual([0: 0] | [1: 1], [0: 0, 1: 1])
        XCTAssertEqual([0: 0] | [:], [0: 0])
        XCTAssertEqual([0: 0] | [1: 1] | [2: 2, 3: 3] | [:] | [4: 4, 5: 5, 6: 6], [0: 0, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6])
    }
    
}
