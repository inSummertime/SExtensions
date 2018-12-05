//
//  StringArrayTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/13.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringArrayTests: XCTestCase {

    func testArray() {
        let text = "[1, \"Hello world!\"]"
        XCTAssertEqual(text.array!.count, 2)
        XCTAssertEqual(text.array![0] as! Int, 1)
        XCTAssertEqual((text.array![1] as! String), "Hello world!")

        let longText = "[{\"int\": 1, \"string\": \"Hello world!\", \"array\": [1, 2]}, {\"int\": 2, \"string\": \"Hello world!\", \"array\": [1, 2]}]"
        XCTAssertEqual(longText.array!.count, 2)
        XCTAssertEqual((longText.array![0] as! [String: Any])["int"]! as! Int, 1)
        XCTAssertEqual(((longText.array![0] as! [String: Any])["array"]! as! [Int])[0], 1)

        XCTAssertNil("Hello world!".array)
        XCTAssertNil("".array)

    }

    func testArrayValue() {
        let text = "[1, \"Hello world!\"]"
        XCTAssertEqual(text.arrayValue.count, 2)
        XCTAssertEqual(text.arrayValue[0] as! Int, 1)
        XCTAssertEqual((text.arrayValue[1] as! String), "Hello world!")

        let longText = "[{\"int\": 1, \"string\": \"Hello world!\", \"array\": [1, 2]}, {\"int\": 2, \"string\": \"Hello world!\", \"array\": [1, 2]}]"
        XCTAssertEqual((longText.arrayValue[0] as! [String: Any])["int"]! as! Int, 1)
        XCTAssertEqual(((longText.arrayValue[0] as! [String: Any])["array"]! as! [Int])[0], 1)

        XCTAssertNotNil("Hello world!".arrayValue)
        XCTAssertTrue("Hello world!".arrayValue.isEmpty)
        XCTAssertTrue("".arrayValue.isEmpty)
    }

}
