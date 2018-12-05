//
//  ArrayAverageTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayAverageTests: XCTestCase {

    func testAverage() {
        XCTAssertEqual([0, 1, 2, 1].average, 1.0)
        XCTAssertEqual([0b0, 0b1, 0b10].average, 1.0)
        XCTAssertEqual([0o0, 0o1, 0o2].average, 1.0)
        XCTAssertEqual([0x0, 0x1, 0x2].average, 1.0)
        XCTAssertEqual([0.0, 1.1, 2.2, 1.1].average, 1.1)
        XCTAssertEqual([Float(0), Float(1.1), Float(2.2), Float(1.1)].average, 1.1)
    }

}
