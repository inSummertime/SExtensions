//
//  DoubleRoundToTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/6.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DoubleRoundToTests: XCTestCase {

    func testRoundTo() {
        XCTAssertEqual(3.1415926.round(to: 2), 3.14)
        XCTAssertEqual(3.1415926.round(to: -1), 3.1415926)
        XCTAssertEqual(-3.1415926.round(to: 0), -3)
        XCTAssertEqual(0.0.round(to: 2), 0.00)
    }
}
