//
//  IntIsTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class IntIsTests: XCTestCase {

    func testIsEven() {
        XCTAssertTrue(0.isEven)
        XCTAssertTrue(2.isEven)
        XCTAssertTrue(4.isEven)
    }

    func testIsOdd() {
        XCTAssertTrue(1.isOdd)
        XCTAssertTrue(3.isOdd)
    }

    func testIsPrime() {
        XCTAssertTrue(1.isPrime)
        XCTAssertTrue(2.isPrime)
        XCTAssertTrue(3.isPrime)
        XCTAssertFalse(4.isPrime)
        XCTAssertTrue(5.isPrime)
        XCTAssertFalse(6.isPrime)
        XCTAssertTrue(7.isPrime)
        XCTAssertFalse(8.isPrime)
        XCTAssertFalse(9.isPrime)
        XCTAssertFalse(10.isPrime)
        XCTAssertTrue(11.isPrime)
        XCTAssertFalse(12.isPrime)
    }

}
