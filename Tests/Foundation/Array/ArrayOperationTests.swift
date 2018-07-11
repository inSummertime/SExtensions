//
//  ArrayOperationTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/27.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayOperationTests: XCTestCase {
    
    func testUnion() {
        XCTAssertEqual(["hello", "world"].union(["!"], ["hello"]), ["hello", "world", "!"])
        let empty: [String] = []
        XCTAssertEqual(empty.union([], []), [])
    }
    
    func testIntersection() {
        XCTAssertEqual(["hello", "world"].intersection(["hello"]), ["hello"])
        XCTAssertEqual(["hello", "world"].intersection(["hello"], ["world"]), [])
        XCTAssertEqual(["hello", "world"].intersection(["hello"], ["!"]), [])
        let empty: [String] = []
        XCTAssertEqual(empty.intersection([], []), [])
    }
    
    func testDifference() {
        XCTAssertEqual(["hello", "world"].difference(["hello"]), ["world"])
        XCTAssertEqual(["hello", "world"].difference(["hello"], ["world"]), [])
        XCTAssertEqual(["hello", "world"].difference(["hello"], ["!"]), ["world", "!"])
        XCTAssertEqual(["hello"].difference(["world"], ["!"]), ["hello", "world", "!"])
        let empty: [String] = []
        XCTAssertEqual(empty.difference([], []), [])
    }

    func testSubtracting() {
        XCTAssertEqual(["hello", "world", "!"].subtracting(["hello"]), ["world", "!"])
        XCTAssertEqual(["hello", "world", "!"].subtracting(["hello", "world"]), ["!"])
        XCTAssertEqual(["hello", "world", "!"].subtracting(["hello", "world"], ["!"]), [])
    }
    
    func testIsSubarray() {
        XCTAssertTrue(["hello"].isSubarray(of: ["hello", "world"]))
        XCTAssertFalse(["hello"].isSubarray(of: ["world"]))
        XCTAssertFalse(["hello"].isSubarray(of: []))
        XCTAssertTrue(["hello"].isSubarray(of: ["hello"]))
    }
    
    func testIsStrictSubarray() {
        XCTAssertFalse(["hello"].isStrictSubarray(of: ["hello"]))
    }
    
    func testContains() {
        XCTAssertTrue(["hello", "world"].contains(["hello"]))
        XCTAssertFalse(["hello"].contains(["world"]))
        XCTAssertFalse(["hello"].contains([]))
        XCTAssertTrue(["hello"].contains(["hello"]))
    }
    
    func testSum() {
        XCTAssertEqual([1, 2, 3].sum, 6)
        XCTAssertEqual([1.0, 2.0, 3.0].sum, 6.0)
    }
    
}
