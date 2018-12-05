//
//  JSONSerializationStringTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class JSONSerializationStringTests: XCTestCase {

    func testJSONStringWithDictionary() {
        let dictionary: [String: Any] = ["id": 0]
        XCTAssertEqual(JSONSerialization.jsonString(with: dictionary)!, "{\"id\":0}")
    }

    func testJSONStringWithArray() {
        let array: [[String: Any]] = [["id": 0], ["title": "title"]]
        XCTAssertEqual(JSONSerialization.jsonString(with: array)!, "[{\"id\":0},{\"title\":\"title\"}]")
    }

}
