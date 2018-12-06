//
//  JSONSerializationJSONObjectTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class JSONSerializationJSONObjectTests: XCTestCase {

    func testJSONObjectFromFile() {
        do {
            let object = try JSONSerialization.jsonObjectFromFile(filename: "Dictionary", callerClass: JSONSerializationJSONObjectTests.self)
            let anotherObject = try JSONSerialization.jsonObjectFromFile(filename: "Dictionary.json", callerClass: JSONSerializationJSONObjectTests.self)
            XCTAssertEqual((object! as! [String: Any])["id"] as! Int, 0)
            XCTAssertEqual((anotherObject! as! [String: Any])["title"] as! String, "title")
        } catch {
            XCTFail("File cannot be read, or failed to create a Foundation object from JSON data.")
        }
    }

    func testDictionaryFromJSONString() {
        let string = "{\"ids\":[\"1\",\"2\"],\"title\":[\"title\"]}"
        do {
            let object = try JSONSerialization.jsonObjectFromString(string)
            XCTAssertEqual((object! as! [String: Any])["ids"] as! [String], ["1", "2"])
        } catch {
            XCTFail("File cannot be read, or failed to create a Foundation object from JSON data.")
        }
    }

}
