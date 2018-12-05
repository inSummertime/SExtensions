//
//  StringTruncateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringTruncateTests: XCTestCase {

    func testTruncatedToIndex() {
        XCTAssertEqual("Hello world!".truncated(toIndex: 0), "H...")
        XCTAssertEqual("Hello world!".truncated(toIndex: 6), "Hello w...")
        XCTAssertEqual("Hello world!".truncated(toIndex: 16), "Hello world!")
        XCTAssertEqual("Hello world!".truncated(toIndex: -16), "")
        XCTAssertEqual("".truncated(toIndex: 16), "")
    }

    func testTruncatedToLength() {
        XCTAssertEqual("Hello world!".truncated(toLength: 0), "")
        XCTAssertEqual("Hello world!".truncated(toLength: 6), "Hello ...")
        XCTAssertEqual("Hello world!".truncated(toLength: 16), "Hello world!")
        XCTAssertEqual("Hello world!".truncated(toLength: -16), "")
        XCTAssertEqual("".truncated(toLength: 16), "")
    }

    func testTruncatedWithConstrainedWidthNumberOfLinesAndFont() {
        let helloWorld = "Hello world!"
        let font = UIFont.systemFont(ofSize: 8.0)
        XCTAssertEqual(helloWorld.truncated(withConstrained: 4.0, font: font, numberOfLines: 1), "...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 16.0, font: font, numberOfLines: 1), "...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 32.0, font: font, numberOfLines: 1), "Hello ...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 64.0, font: font, numberOfLines: 1), "Hello world!")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 4.0, font: font, numberOfLines: 2), "...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 16.0, font: font, numberOfLines: 2), "Hello ...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 32.0, font: font, numberOfLines: 2), "Hello world!")
        XCTAssertEqual(helloWorld.truncated(withConstrained: 64.0, font: font, numberOfLines: 2), "Hello world!")
        XCTAssertEqual("".truncated(withConstrained: 64.0, font: font, numberOfLines: 2), "")
        XCTAssertEqual("".truncated(withConstrained: 4.0, font: font, numberOfLines: 0), "")
    }

    func testTruncatedWithConstrainedSizeAndFont() {
        let helloWorld = "Hello world!"
        let font = UIFont.systemFont(ofSize: 8.0)
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 4.0, height: 4.0), font: font), "...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 16.0, height: 16.0), font: font), "...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 32.0, height: 16.0), font: font), "Hello ...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 16.0, height: 32.0), font: font), "Hello w...")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 32.0, height: 32.0), font: font), "Hello world!")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 64.0, height: 32.0), font: font), "Hello world!")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 32.0, height: 64.0), font: font), "Hello world!")
        XCTAssertEqual(helloWorld.truncated(withConstrained: CGSize(width: 64.0, height: 64.0), font: font), "Hello world!")
        XCTAssertEqual("".truncated(withConstrained: CGSize(width: 4.0, height: 64.0), font: font), "")
        XCTAssertEqual("".truncated(withConstrained: CGSize(width: 64.0, height: 64.0), font: font), "")
    }

}
