//
//  ArrayRemoveTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayRemoveTests: XCTestCase {
    
    func testRemovingAtPositions() {
        XCTAssertEqual(["hello", "world", "!"].removing(at: 0, 1), ["!"])
        XCTAssertEqual(["hello", "world", "!"].removing(at: 7), ["hello", "world", "!"])
    }
    
    func testRemovingElements() {
        XCTAssertEqual(["hello", "world", "!"].removing("hello", "world"), ["!"])
        XCTAssertEqual(["hello", "world", "!"].removing("", " "), ["hello", "world", "!"])
    }
    
    func testRemovingArrays() {
        XCTAssertEqual(["hello", "world", "!"].removing(["hello"], ["world", "!"]), [])
        XCTAssertEqual(["hello", "world", "!"].removing([" "], ["", "0"]), ["hello", "world", "!"])
    }
    
    func testRemovingCountableRange() {
        XCTAssertEqual(["hello", "world", "!"].removingCountableRange(0..<2), ["!"])
        XCTAssertEqual(["hello", "world", "!"].removingCountableRange(2..<7), ["hello", "world"])
    }
    
    func removingCountableClosedRange() {
        XCTAssertEqual(["hello", "world", "!"].removingCountableClosedRange(0...2), [])
        XCTAssertEqual(["hello", "world", "!"].removingCountableClosedRange(2...7), ["hello", "world"])
    }
    
}
