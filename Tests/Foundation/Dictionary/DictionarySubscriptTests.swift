//
//  DictionarySubscriptTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/13.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DictionarySubscriptTests: XCTestCase {
    
    func testSubscriptString() {
        XCTAssertEqual(["hello": "world"][string: "hello"]!, "world")
        XCTAssertNil(["hello": "world"][string: "world"])
        XCTAssertNil(["hello": 1][string: "hello"])
        XCTAssertNil(["hello": 1.0][string: "hello"])
        XCTAssertNil(["hello": ["hello": "world"]][string: "hello"])
        XCTAssertNil(["hello": ["hello", "world"]][string: "hello"])
    }
    
    func testSubscriptStringValue() {
        XCTAssertEqual(["hello": "world"][stringValue: "hello"], "world")
        XCTAssertEqual(["hello": "world"][stringValue: "world"], "")
        XCTAssertEqual(["hello": 1][stringValue: "hello"], "")
        XCTAssertEqual(["hello": 1.0][stringValue: "hello"], "")
        XCTAssertEqual(["hello": ["hello": "world"]][stringValue: "hello"], "")
        XCTAssertEqual(["hello": ["hello", "world"]][stringValue: "hello"], "")
    }
    
    func testSubscriptInt() {
        XCTAssertEqual(["hello": 1][int: "hello"]!, 1)
        XCTAssertNil(["hello": 1][int: "world"])
        XCTAssertNil(["hello": 1.0][int: "hello"])
        XCTAssertNil(["hello": "world"][int: "world"])
        XCTAssertNil(["hello": ["hello": "world"]][int: "hello"])
        XCTAssertNil(["hello": ["hello", "world"]][int: "hello"])
    }
    
    func testSubscriptIntValue() {
        XCTAssertEqual(["hello": 1][intValue: "hello"], 1)
        XCTAssertEqual(["hello": 1][intValue: "world"], 0)
        XCTAssertEqual(["hello": 1.0][intValue: "hello"], 0)
        XCTAssertEqual(["hello": "world"][intValue: "hello"], 0)
        XCTAssertEqual(["hello": ["hello": "world"]][intValue: "hello"], 0)
        XCTAssertEqual(["hello": ["hello", "world"]][intValue: "hello"], 0)
    }
    
    func testSubscriptDouble() {
        XCTAssertEqual(["hello": 1.0][double: "hello"]!, 1.0)
        XCTAssertNil(["hello": 1.0][double: "world"])
        XCTAssertNil(["hello": 1][double: "hello"])
        XCTAssertNil(["hello": "world"][double: "world"])
        XCTAssertNil(["hello": ["hello": "world"]][double: "hello"])
        XCTAssertNil(["hello": ["hello", "world"]][double: "hello"])
    }
    
    func testSubscriptDoubleValue() {
        XCTAssertEqual(["hello": 1.0][doubleValue: "hello"], 1.0)
        XCTAssertEqual(["hello": 1.0][doubleValue: "world"], 0.0)
        XCTAssertEqual(["hello": 1][doubleValue: "hello"], 0.0)
        XCTAssertEqual(["hello": "world"][doubleValue: "hello"], 0.0)
        XCTAssertEqual(["hello": ["hello": "world"]][doubleValue: "hello"], 0.0)
        XCTAssertEqual(["hello": ["hello", "world"]][doubleValue: "hello"], 0.0)
    }
    
    func testSubscriptArray() {
        XCTAssertEqual(["hello": ["hello", "world"]][array: "hello"]! as! [String], ["hello", "world"])
        XCTAssertNil(["hello": ["hello", "world"]][array: "world"])
        XCTAssertNil(["hello": 1.0][array: "world"])
        XCTAssertNil(["hello": 1][array: "hello"])
        XCTAssertNil(["hello": "world"][array: "world"])
        XCTAssertNil(["hello": ["hello": "world"]][array: "hello"])
    }
    
    func testSubscriptArrayValue() {
        XCTAssertEqual(["hello": ["hello", "world"]][arrayValue: "hello"] as! [String], ["hello", "world"])
        XCTAssertEqual(["hello": ["hello", "world"]][arrayValue: "world"] as! [String], Array<String>())
        XCTAssertEqual(["hello": 1][arrayValue: "hello"].count, 0)
        XCTAssertEqual(["hello": 1.0][arrayValue: "hello"].count, 0)
        XCTAssertEqual(["hello": "world"][arrayValue: "hello"].count, 0)
        XCTAssertEqual(["hello": ["hello": "world"]][arrayValue: "hello"].count, 0)
    }
    
    func testSubscriptDictionary() {
        XCTAssertEqual(["hello": ["hello": "world"]][dictionary: "hello"]! as! [String: String], ["hello": "world"])
        XCTAssertNil(["hello": ["hello", "world"]][dictionary: "world"])
        XCTAssertNil(["hello": 1.0][dictionary: "world"])
        XCTAssertNil(["hello": 1][dictionary: "hello"])
        XCTAssertNil(["hello": "world"][dictionary: "world"])
        XCTAssertNil(["hello": ["hello", "world"]][dictionary: "hello"])
    }
    
    func testSubscriptDictionaryValue() {
        XCTAssertEqual(["hello": ["hello": "world"]][dictionaryValue: "hello"] as! [String: String], ["hello": "world"])
        XCTAssertEqual(["hello": ["hello": "world"]][dictionaryValue: "world"] as! [String: String], Dictionary<String, String>())
        XCTAssertTrue(["hello": 1][dictionaryValue: "hello"].isEmpty)
        XCTAssertTrue(["hello": 1.0][dictionaryValue: "hello"].isEmpty)
        XCTAssertTrue(["hello": "world"][dictionaryValue: "hello"].isEmpty)
        XCTAssertTrue(["hello": ["hello", "world"]][dictionaryValue: "hello"].isEmpty)
    }
    
    func testSubscriptChain() {
        XCTAssertEqual(["hello": ["hello": "world"]][dictionaryValue: "hello"][string: "hello"], "world")
        XCTAssertEqual(["hello": ["hello": ["hello": "world"]]][dictionaryValue: "hello"][dictionaryValue: "hello"][string: "hello"], "world")
    }
    
}
