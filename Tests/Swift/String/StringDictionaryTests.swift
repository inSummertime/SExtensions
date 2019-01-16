//
//  StringDictionaryTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class StringDictionaryTests: XCTestCase {

    func testJSONDictionary() {
        let text = "{\"int\": 1, \"string\": \"Hello world!\", \"array\": [1, 2]}"
        XCTAssertEqual(text.jsonDictionary?["int"] as? Int, 1)
        XCTAssertEqual(text.jsonDictionary?["string"] as? String, "Hello world!")
        XCTAssertEqual((text.jsonDictionary?["array"] as? [Int])?[0], 1)

        XCTAssertNil("Hello world!".jsonDictionary)
        XCTAssertNil("".jsonDictionary)
        XCTAssertNil("hello: world".jsonDictionary)
        XCTAssertNil("hello: world, 0: 1".jsonDictionary)
    }

    func testJSONDictionaryValue() {
        let text = "{\"int\": 1, \"string\": \"Hello world!\", \"array\": [1, 2]}"
        XCTAssertEqual(text.jsonDictionaryValue["int"] as? Int, 1)
        XCTAssertEqual(text.jsonDictionaryValue["string"] as? String, "Hello world!")
        XCTAssertEqual((text.jsonDictionaryValue["array"] as? [Int])?[0], 1)

        XCTAssertNotNil("Hello world!".jsonDictionaryValue)
        XCTAssertTrue("Hello world!".jsonDictionaryValue.isEmpty)
        XCTAssertTrue("".jsonDictionaryValue.isEmpty)
        XCTAssertTrue("hello: world".jsonDictionaryValue.isEmpty)
        XCTAssertTrue("hello: world, 0: 1".jsonDictionaryValue.isEmpty)
    }

    func testStringDictionary() {
        XCTAssertNotNil("hello:world".stringDictionary)
        XCTAssertNotNil("hello:  world".stringDictionary)
        XCTAssertNil(":".stringDictionary)
        XCTAssertNil("hello:".stringDictionary)
        XCTAssertNil(":world".stringDictionary)
        XCTAssertNil("hello::".stringDictionary)
        XCTAssertNil("::hello::".stringDictionary)
        XCTAssertNil("hello:world,".stringDictionary)
        XCTAssertNil(",hello:world".stringDictionary)
        XCTAssertNil(",hello:world,".stringDictionary)
        XCTAssertNil("hello:world, 0".stringDictionary)
        XCTAssertNil("hello:world, 0:".stringDictionary)
        XCTAssertNil("hello:world, 0:1,".stringDictionary)
        XCTAssertEqual("hello: world".stringDictionary?["hello"], "world")
        XCTAssertEqual("  hello:  world,  0:  1 ".stringDictionary?["hello"], "world")
        XCTAssertEqual("  hello:  world,  0:  1 ".stringDictionary?["0"], "1")
    }

    func testStringDictionaryValue() {
        XCTAssertTrue(":".stringDictionaryValue.isEmpty)
        XCTAssertTrue(":".stringDictionaryValue.isEmpty)
        XCTAssertTrue("hello:".stringDictionaryValue.isEmpty)
        XCTAssertTrue(":world".stringDictionaryValue.isEmpty)
        XCTAssertTrue("hello::".stringDictionaryValue.isEmpty)
        XCTAssertTrue("::hello::".stringDictionaryValue.isEmpty)
        XCTAssertTrue("hello:world,".stringDictionaryValue.isEmpty)
        XCTAssertTrue(",hello:world".stringDictionaryValue.isEmpty)
        XCTAssertTrue(",hello:world,".stringDictionaryValue.isEmpty)
        XCTAssertTrue("hello:world, 0".stringDictionaryValue.isEmpty)
        XCTAssertTrue("hello:world, 0:".stringDictionaryValue.isEmpty)
        XCTAssertTrue("hello:world, 0:1,".stringDictionaryValue.isEmpty)
        XCTAssertFalse("Hello:  world!".stringDictionaryValue.isEmpty)
        XCTAssertEqual("Hello: world!".stringDictionaryValue["Hello"], "world!")
        XCTAssertEqual(" Hello:  world!,  0:  1 ".stringDictionaryValue["Hello"], "world!")
        XCTAssertEqual(" Hello:  world!,  0:  1 ".stringDictionaryValue["0"], "1")
    }
}
