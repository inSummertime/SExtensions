//
//  OptionalIsNilOrEmptyTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/29.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class OptionalIsNilOrEmptyTests: XCTestCase {

    func testIsNilOrEmpty() {
        var array: [Int]?
        XCTAssertTrue(array.isNilOrEmpty)
        array = []
        XCTAssertTrue(array.isNilOrEmpty)
        array = [1]
        XCTAssertFalse(array.isNilOrEmpty)
    }

}
