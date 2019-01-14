//
//  ArrayIndexTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/3.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class ArrayIndexTests: XCTestCase {

    func testIndexesOf() {
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes(of: "hello"), [0, 3])
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes(of: "0"), [])
    }

    func testLastIndex() {
        XCTAssertEqual([0, 1, 2, 3, 1].lastIndex(of: 1), 4)
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].lastIndex(of: "hello"), 3)
        XCTAssertNil(["hello", "world", "!", "hello", "world", "!"].lastIndex(of: "0"))
        XCTAssertNil([].lastIndex(of: ""))
    }

    func testIndexesIsIncluded() {
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes({ $0.count == 5 }), [0, 1, 3, 4])
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes({ $0.count == 2 }), [])
    }
}
