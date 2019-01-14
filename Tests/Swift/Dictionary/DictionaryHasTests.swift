//
//  DictionaryHasTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/24.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DictionaryHasTests: XCTestCase {

    func testhasKey() {
        XCTAssertTrue(["hello": 0].hasKey("hello"))
        XCTAssertTrue([0: "world"].hasKey(0))
        XCTAssertFalse(["hello": "world"].hasKey("!"))
        XCTAssertFalse([0: 1].hasKey("!"))
    }

    func hasAny() {
        XCTAssertTrue(["hello": 0, "world": 1].hasAny({ $0.1 == 0 }))
        XCTAssertFalse(["hello": 0, "world": 1].hasAny({ $0.0 == "!" && $0.1 == 1 }))
    }

    func hasAll() {
        XCTAssertFalse(["hello": 0, "world": 1].hasAll({ $0.1 == 0 }))
        XCTAssertTrue(["hello": 0, "world": 1].hasAll({ $0.0.count == 5 }))
    }

    func hasKeyValue() {
        XCTAssertTrue(["hello": 0].has(key: "hello", value: 0))
        XCTAssertFalse(["hello": 0, "world": 1].has(key: "hello", value: 1))
    }

    func hasElement() {
        XCTAssertTrue(["hello": 0].hasElement(("hello", 0)))
        XCTAssertFalse(["hello": 0, "world": 1].hasElement(("hello", 1)))
    }
}
