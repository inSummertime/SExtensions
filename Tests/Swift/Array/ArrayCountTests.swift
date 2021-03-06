//
//  ArrayCountTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/19.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class ArrayCountTests: XCTestCase {

    func testCountOfElement() {
        XCTAssertEqual([0, 0, 1, 2].countOfElement(0), 2)
        XCTAssertEqual([0, 1].countOfElement(2), 0)
        XCTAssertEqual([].countOfElement(0), 0)
        XCTAssertEqual([0, 1].countOfElement(2.0), 0)
        XCTAssertEqual(["hello", "world"].countOfElement("hello"), 1)
        XCTAssertEqual(["hello", "world"].countOfElement("Hello"), 0)
        XCTAssertEqual(["hello", "world"].countOfElement(""), 0)
        XCTAssertEqual([].countOfElement(""), 0)
    }

    func testCountDictionary() {
        XCTAssertEqual([0, 0, 1, 2].countDictionary, [0: 2, 1: 1, 2: 1])
        XCTAssertEqual([].countDictionary, [:])
        XCTAssertEqual(["hello", "world"].countDictionary, ["hello": 1, "world": 1])
    }

    func testMostCountElement() {
        XCTAssertNil([String]().mostCountElement)
        XCTAssertNil([0, 1, 2].mostCountElement)
        XCTAssertEqual([0, 0, 1].mostCountElement, 0)
        XCTAssertEqual(["hello", "world", "!", "!", ""].mostCountElement, "!")
    }

    func testMajorityElement() {
        XCTAssertNil([String]().majorityElement)
        XCTAssertNil([0, 1, 2].majorityElement)
        XCTAssertNil([0, 1, 2, 2].majorityElement)
        XCTAssertEqual([0, 0, 1].majorityElement, 0)
        XCTAssertEqual(["hello", "world", "!", "!", "!"].majorityElement, "!")
    }
}
