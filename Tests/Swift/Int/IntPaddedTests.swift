//
//  IntPaddedTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/13.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class IntPaddedTests: XCTestCase {

    func testPadded() {
        XCTAssertEqual(1.padded(fieldWidth: 10), "0000000001")
        XCTAssertEqual((-1).padded(fieldWidth: 2), "-1")
        XCTAssertEqual((-1).padded(fieldWidth: 3), "-01")
    }
}
