//
//  DictionaryRemoveTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DictionaryRemoveTests: XCTestCase {
    
    func testRemovingValueForKeys() {
        XCTAssertTrue(["hello": "", "world": ""].removingValueForKeys("hello", "world").isEmpty)
        XCTAssertTrue(["hello": "", "world": ""].removingValueForKeys("hello", "world", "!").isEmpty)
        XCTAssertEqual(["hello": "world", "!": ""].removingValueForKeys("hello"), ["!": ""])
    }
    
    func testRemovingValues() {
        XCTAssertTrue(["hello": "world", "!": ""].removingValues("world", "").isEmpty)
        XCTAssertTrue(["hello": "", "world": ""].removingValues("hello", "world", "").isEmpty)
        XCTAssertEqual(["hello": "world", "!": ""].removingValues("world"), ["!": ""])
    }
    
    func testRemovingEmpty() {
        XCTAssertTrue(["hello": ""].removingEmpty().isEmpty)
        XCTAssertTrue(["": "world"].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": "", "world": ""].removingEmpty().isEmpty)
        XCTAssertFalse(["hello": "", "world": "!"].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["world": ""]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["world": ["!":""]]].removingEmpty().isEmpty)
        XCTAssertFalse(["hello": ["world": ["!":0]]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": [:]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["world":[:]]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["world":["!":[:]]]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": []].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["", ""]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": [[""], ["", ""]]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["": ["", ""]]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["", ["": ""]]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": NSNull()].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": [NSNull()]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["world": NSNull()]].removingEmpty().isEmpty)
        XCTAssertTrue(["hello": ["hello": [""]], "world": ["", ["": ""]], "!": "", "Null": NSNull()].removingEmpty().isEmpty)
        
        XCTAssertEqual(["hello": "world"].removingEmpty()["hello"]!, "world")
        XCTAssertEqual(["hello": "world", "!": ""].removingEmpty()["hello"]!, "world")
        XCTAssertEqual(["hello": ["world", "!", ""]].removingEmpty()["hello"]!, ["world", "!"])
        XCTAssertEqual(["hello": ["world": "!", "":  ""]].removingEmpty()["hello"]!["world"]!, "!")
        XCTAssertEqual(["hello": ["world": ["!", ""]]].removingEmpty()["hello"]!["world"]!, ["!"])
        XCTAssertEqual((["hello": ["world": "!", "!": NSNull()]].removingEmpty()["hello"] as! [String: String])["world"]!, "!")
        XCTAssertEqual((["hello": ["world": ["!", NSNull()]]].removingEmpty()["hello"] as! [String: [String]])["world"]!, ["!"])
    }
    
}
