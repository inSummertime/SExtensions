//
//  JSONSerializationDictionaryTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class JSONSerializationDictionaryTests: XCTestCase {
    
    func testDictionaryFromJSONFile() {
        do {
            let dictionary = try JSONSerialization.dictionaryFromJSONFile(filename: "Dictionary", callerClass: JSONSerializationDictionaryTests.self)
            let anotherDictionary = try  JSONSerialization.dictionaryFromJSONFile(filename: "Dictionary.json", callerClass: JSONSerializationDictionaryTests.self)
            XCTAssertEqual(dictionary!["id"] as! Int, 0)
            XCTAssertEqual(anotherDictionary!["title"] as! String, "title")
        } catch {
            XCTFail()
        }
    }
    
    func testDictionaryFromJSONString() {
        let string = "{\"ids\":[\"1\",\"2\"],\"title\":[\"title\"]}"
        do {
            let dictionary = try JSONSerialization.dictionaryFromJSONString(string)
            XCTAssertEqual(dictionary!["ids"] as! [String], ["1", "2"])
            XCTAssertEqual(dictionary!["title"] as! [String], ["title"])
        } catch {
            XCTFail()
        }
    }
    
}
