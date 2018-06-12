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
        let text = "{\"int\": 1, \"string\": \"Hello world!\", \"array\": [1, 2]}"
        XCTAssertEqual(text.dictionary!["int"]! as! Int, 1)
        XCTAssertEqual(text.dictionary!["string"]! as! String, "Hello world!")
        XCTAssertEqual((text.dictionary!["array"]! as! [Int])[0], 1)
        
        XCTAssertNil("Hello world!".dictionary)
        XCTAssertNil("".dictionary)
    }
    
    func testDictionaryValue() {
        let text = "{\"int\": 1, \"string\": \"Hello world!\", \"array\": [1, 2]}"
        XCTAssertEqual(text.dictionaryValue["int"]! as! Int, 1)
        XCTAssertEqual(text.dictionaryValue["string"]! as! String, "Hello world!")
        XCTAssertEqual((text.dictionaryValue["array"]! as! [Int])[0], 1)
        
        XCTAssertNotNil("Hello world!".dictionaryValue)
        XCTAssertTrue("Hello world!".dictionaryValue.isEmpty)
        XCTAssertTrue("".dictionaryValue.isEmpty)
    }
    
}
