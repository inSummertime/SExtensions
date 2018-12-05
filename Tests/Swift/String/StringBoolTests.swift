//
//  StringBoolTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/28.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringBoolTests: XCTestCase {

    func testTrue() {
        XCTAssertTrue("TRUE".bool!)
        XCTAssertTrue("true".bool!)
        XCTAssertTrue("yes".bool!)
        XCTAssertTrue("1".bool!)
        XCTAssertTrue("One".bool!)
    }

    func testFalse() {
        XCTAssertFalse("False".bool!)
        XCTAssertFalse("no".bool!)
        XCTAssertFalse("0".bool!)
        XCTAssertFalse("zero".bool!)
    }

    func textNil() {
        XCTAssertNil("hi".bool)
    }

    func textBoolValue() {
        XCTAssertFalse("hi".boolValue)
        XCTAssertTrue("0".boolValue)
        XCTAssertFalse("".boolValue)
    }

}
