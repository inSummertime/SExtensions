//
//  OptionalIsNilOrEmptyTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/29.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class OptionalIsNilOrEmptyTests: XCTestCase {

    func testIsNilOrEmptyCollection() {
        var array: [Int]?
        XCTAssertTrue(array.isNilOrEmpty)
        array = []
        XCTAssertTrue(array.isNilOrEmpty)
        array = [1]
        XCTAssertFalse(array.isNilOrEmpty)
    }

    func testIsNilOrEmptyString() {
        var string: String?
        XCTAssertTrue(string.isNilOrEmpty)
        string = ""
        XCTAssertTrue(string.isNilOrEmpty)
        string = "!"
        XCTAssertFalse(string.isNilOrEmpty)
    }
}
