//
//  DictionaryJSONTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DictionaryJSONTests: XCTestCase {
    
    func testJSONData() {
        XCTAssertNotNil([:].jsonData())
        XCTAssertNotNil([String: Any]().jsonData())
        XCTAssertNotNil([String: AnyObject]().jsonData())
        XCTAssertNotNil([String: NSObject]().jsonData())
        XCTAssertNotNil([Int: Any]().jsonData())
        XCTAssertNotNil([Double: Any]().jsonData())
        XCTAssertNotNil([Float: Any]().jsonData())
        XCTAssertNotNil(["": 0].jsonData())
        XCTAssertNotNil(["": ""].jsonData())
        XCTAssertNotNil(["hello": "world"].jsonData())
        XCTAssertNotNil(["hello": ["world": "!"]].jsonData())
        XCTAssertNotNil(["hello": ["world", "!"]].jsonData())
        XCTAssertNil([0: 1].jsonData())
        XCTAssertNil([0.0: 1.0].jsonData())
        XCTAssertNil([0.0: "1"].jsonData())
        XCTAssertEqual(["hello": "world"].jsonData(), "{\"hello\":\"world\"}".data(using: .utf8))
        print(["hello": "world"].jsonData())
    }
    
    func testJSONString() {
        XCTAssertEqual([:].jsonString(), "{}")
        XCTAssertEqual([String: Any]().jsonString(), "{}")
        XCTAssertEqual([String: AnyObject]().jsonString(), "{}")
        XCTAssertEqual([String: NSObject]().jsonString(), "{}")
        XCTAssertEqual([Int: Any]().jsonString(), "{}")
        XCTAssertEqual([Double: Any]().jsonString(), "{}")
        XCTAssertEqual([Float: Any]().jsonString(), "{}")
        XCTAssertEqual(["": 0].jsonString(), "{\"\":0}")
        XCTAssertEqual(["": ""].jsonString(), "{\"\":\"\"}")
        XCTAssertEqual(["hello": "world"].jsonString(), "{\"hello\":\"world\"}")
        XCTAssertEqual(["hello": ["world": "!"]].jsonString(), "{\"hello\":{\"world\":\"!\"}}")
        XCTAssertEqual(["hello": ["world", "!"]].jsonString(), "{\"hello\":[\"world\",\"!\"]}")
    }
    
}
