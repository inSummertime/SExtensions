//
//  ArraySumTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArraySumTests: XCTestCase {

    func testSum() {
        XCTAssertEqual([1, 2, 3, 4].sum, 10)
        XCTAssertEqual([1.1, 2.2, 3.3, 4.4].sum, 11.0)
        XCTAssertEqual(["Hello", " ", "world", "!"].sum, "Hello world!")
    }

}
