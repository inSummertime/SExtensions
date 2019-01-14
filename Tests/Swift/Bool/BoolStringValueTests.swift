//
//  BoolStringValueTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/16.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class BoolStringValueTests: XCTestCase {

    func testStringValue() {
        XCTAssertEqual(true.stringValue, "1")
        XCTAssertEqual(false.stringValue, "0")
    }
}
