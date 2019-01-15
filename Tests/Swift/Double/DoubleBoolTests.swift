//
//  DoubleBoolTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/5.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DoubleBoolTests: XCTestCase {

    func testBool() {
        XCTAssertTrue(1.0.bool)
        XCTAssertFalse(0.bool)
        XCTAssertFalse((-1.0).bool)
        XCTAssertFalse(2.0.bool)
        XCTAssertFalse(Double.nan.bool)
    }
}
