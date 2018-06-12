//
//  StringDictionaryTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringDictionaryTests: XCTestCase {
    
    func testDictionary() {
        let text = "{\"id\": 1, \"name\": \"inSummertime\", \"ids\": [1, 2]}"
        XCTAssertEqual(text.dictionary!["id"]! as! Int, 1)
        XCTAssertEqual(text.dictionary!["name"]! as! String, "inSummertime")
        XCTAssertEqual((text.dictionary!["ids"]! as! [Int])[0], 1)
        XCTAssertNil("Hello world!".dictionary)
        XCTAssertNil("".dictionary)
    }
    
    func testDictionaryValue() {
        let text = "{\"id\": 1, \"name\": \"inSummertime\", \"ids\": [1, 2]}"
        XCTAssertEqual(text.dictionaryValue["id"]! as! Int, 1)
        XCTAssertEqual(text.dictionaryValue["name"]! as! String, "inSummertime")
        XCTAssertEqual((text.dictionaryValue["ids"]! as! [Int])[0], 1)
        XCTAssertNotNil("Hello world!".dictionaryValue)
        XCTAssertTrue("Hello world!".dictionaryValue.isEmpty)
        XCTAssertTrue("".dictionaryValue.isEmpty)
    }
    
}
