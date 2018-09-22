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
    
    func testRemovingCountableClosedRange() {
        XCTAssertEqual(["hello", "world", "!"].removingCountableClosedRange(0...2), [])
        XCTAssertEqual(["hello", "world", "!"].removingCountableClosedRange(2...7), ["hello", "world"])
    }
    
    func testRemovingEmpty() {
        XCTAssertTrue([""].removingEmpty().isEmpty)
        XCTAssertFalse(["hello", " "].removingEmpty().isEmpty)
        XCTAssertTrue([[]].removingEmpty().isEmpty)
        XCTAssertTrue([[""]].removingEmpty().isEmpty)
        XCTAssertFalse([["world"]].removingEmpty().isEmpty)
        XCTAssertTrue([[:]].removingEmpty().isEmpty)
        XCTAssertTrue([["hello": ""]].removingEmpty().isEmpty)
        XCTAssertTrue([["hello": ["world": [:]]]].removingEmpty().isEmpty)
        XCTAssertTrue([[""], ["", ""]].removingEmpty().isEmpty)
        XCTAssertTrue(["": ["", ""]].removingEmpty().isEmpty)
        XCTAssertTrue([NSNull()].removingEmpty().isEmpty)
        XCTAssertTrue([[NSNull()]].removingEmpty().isEmpty)
        XCTAssertTrue([["world": NSNull()]].removingEmpty().isEmpty)
        XCTAssertTrue([["", ""], [], "", ["hello": ""], NSNull(), [[""]], [[:]], [["hello": []]]].removingEmpty().isEmpty)
        
        XCTAssertEqual(["hello", "world"].removingEmpty(), ["hello", "world"])
        XCTAssertEqual((["hello", "world", "!", "", [], [:], NSNull()].removingEmpty() as! [String]), ["hello", "world", "!"])
        XCTAssertEqual((["hello", "world", "", ["", []], ["!": []], NSNull()].removingEmpty() as! [String]), ["hello", "world"])
        XCTAssertEqual((["hello", "", [[]], ["!": [NSNull()]]].removingEmpty() as! [String]), ["hello"])
    }
    
    func testRemovingNil() {
        XCTAssertEqual([0, nil, 1].removingNils(), [0, 1])
        XCTAssertEqual(["hello", nil, "world", nil].removingNils(), ["hello",  "world"])
        let array: [Double?] = [nil, nil]
        XCTAssertEqual(array.removingNils(), [])
    }
    
    func testRemovingDuplicates() {
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].removingDuplicates(), ["hello", "world", "!"])
        XCTAssertEqual([0, 1, 0, 1].removingDuplicates(), [0, 1])
        XCTAssertEqual([String]().removingDuplicates(), [])
    }
    
}
