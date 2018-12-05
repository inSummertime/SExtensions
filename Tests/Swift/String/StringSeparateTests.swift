//
//  StringSeparateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringSeparateTests: XCTestCase {

    func testUppercaseLetterSeparated() {
        XCTAssertEqual("helloWorld".uppercaseLetterSeparated, "hello World")
    }

    func testNewlineSeparated() {
        XCTAssertEqual("\nhello\nworld\n".newlineSeparated, "hello \nworld")
    }

    func testSeparateByText() {
        XCTAssertEqual("helloWorld".separating(by: "w"), "helloWorld")
        XCTAssertEqual("helloWorld".separating(by: "W"), "hello World")
    }

    func testSeparateByCharacterSet() {
        XCTAssertEqual("hello-world".separating(by: .punctuationCharacters), "hello -world")
    }

}
