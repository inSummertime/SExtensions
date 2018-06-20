//
//  DictionaryEmptyRemovedTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/19.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DictionaryEmptyRemovedTests: XCTestCase {
    
    func testEmptyStringRemoved() {
        XCTAssertTrue(["hello": ""].emptyRemoved.isEmpty)
        XCTAssertTrue(["": "world"].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": "", "world": ""].emptyRemoved.isEmpty)
        XCTAssertFalse(["hello": "", "world": "!"].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["world": ""]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["world": ["!":""]]].emptyRemoved.isEmpty)
        XCTAssertFalse(["hello": ["world": ["!":0]]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": [:]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["world":[:]]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["world":["!":[:]]]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": []].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["", ""]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": [[""], ["", ""]]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["": ["", ""]]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["", ["": ""]]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": NSNull()].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": [NSNull()]].emptyRemoved.isEmpty)
        XCTAssertTrue(["hello": ["world": NSNull()]].emptyRemoved.isEmpty)
        
        XCTAssertEqual(["hello": "world"].emptyRemoved as! [String: String], ["hello": "world"])
        XCTAssertEqual(["hello": "world", "!": ""].emptyRemoved as! [String: String], ["hello": "world"])
        XCTAssertEqual(["hello": ["world", "!", ""]].emptyRemoved as! [String: [String]], ["hello": ["world", "!"]])
        XCTAssertEqual((["hello": ["world": "!", "":  ""]].emptyRemoved["hello"]! as! [String: String])["world"], "!")
        XCTAssertEqual((["hello": ["world": ["!", ""]]].emptyRemoved["hello"] as! [String: [String]])["world"], ["!"])
        XCTAssertEqual((["hello": ["world": "!", "!": NSNull()]].emptyRemoved["hello"] as! [String: String])["world"], "!")
        XCTAssertEqual((["hello": ["world": ["!", NSNull()]]].emptyRemoved["hello"] as! [String: [String]])["world"], ["!"])
    }
    
}
