//
//  SetOperationTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class SetOperationTests: XCTestCase {

    func testDifference() {
        let set: Set = ["hello", "world"]
        XCTAssertEqual(set.difference(["hello"]), ["world"])
        XCTAssertEqual(set.difference(["hello"], ["world"]), [])
        XCTAssertEqual(set.difference(["hello"], ["!"]), ["world", "!"])
        XCTAssertEqual(set.difference(["hello"], ["!"]), ["!", "world"])
        let anotherSet: Set = ["hello"]
        XCTAssertEqual(anotherSet.difference(["world"], ["!"]), ["hello", "world", "!"])
        let empty: Set<String> = []
        XCTAssertEqual(empty.difference([], []), [])
    }

    func testContains() {
        let set: Set = ["hello", "world"]
        XCTAssertTrue(set.contains(["hello"]))
        let anotherSet: Set = ["hello"]
        XCTAssertFalse(anotherSet.contains(["world"]))
        XCTAssertTrue(anotherSet.contains([]))
        XCTAssertTrue(anotherSet.contains(["hello"]))
        let empty: Set<String> = []
        XCTAssertFalse(empty.contains(["world"]))
        XCTAssertTrue(empty.contains([]))
    }

}
