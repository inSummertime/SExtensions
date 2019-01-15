//
//  IntNumberOfBitOneTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest

final class IntNumberOfBitOneTests: XCTestCase {

    func testNumberOfBitOne() {
        XCTAssertEqual(0.numberOfBitOne, 0)
        XCTAssertEqual(1.numberOfBitOne, 1)
        XCTAssertEqual(2.numberOfBitOne, 1)
        XCTAssertEqual(3.numberOfBitOne, 2)
        XCTAssertEqual((-4).numberOfBitOne, 1)
    }

    func testNumberOfBitZero() {
        XCTAssertEqual(0.numberOfBitZero, 1)
        XCTAssertEqual(1.numberOfBitZero, 0)
        XCTAssertEqual(2.numberOfBitZero, 1)
        XCTAssertEqual(3.numberOfBitZero, 0)
        XCTAssertEqual((-4).numberOfBitZero, 2)
    }
}
