//
//  IntReversedTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class IntReversedTests: XCTestCase {

    func testReversed() {
        XCTAssertEqual(123.reversed!, 321)
        XCTAssertEqual(-123.reversed!, -321)
        XCTAssertEqual(1.reversed!, 1)
    }
}
