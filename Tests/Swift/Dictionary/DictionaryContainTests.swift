//
//  DictionaryContainTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/30.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DictionaryContainTests: XCTestCase {

    func testContainsValue() {
        XCTAssertTrue(["hello": 0, "world": 1].contains(value: 0))
        XCTAssertFalse(["hello": 0, "world": 1].contains(value: 2))
        XCTAssertFalse([:].contains(value: 0))
    }

    func testContainsOther() {
        XCTAssertTrue(["hello": 0, "world": 1].contains(other: ["hello": 0]))
        XCTAssertTrue(["hello": 0, "world": 1].contains(other: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0, "world": 1].contains(other: ["": 0]))
        XCTAssertFalse(["hello": 0, "world": 1].contains(other: [:]))
        XCTAssertFalse(["hello": 0, "world": 1].contains(other: ["hello": 0, "world": 1, "!": 2]))
        XCTAssertFalse([:].contains(other: ["hello": 0]))
    }
}
