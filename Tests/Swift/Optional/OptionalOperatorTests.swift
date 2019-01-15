//
//  OptionalOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/3.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class OptionalOperatorTests: XCTestCase {

    func testCombileInt() {
        let a: Int? = 0
        let b: Int? = 1
        XCTAssertEqual(a + b, 1)

        let c: Int? = nil
        let d: Int? = nil
        XCTAssertNil(c + d)

        let e: Int? = nil
        let f: Int? = 1
        XCTAssertEqual(e + f, 1)
    }

    func testCombileDoule() {
        let a: Double? = 0
        let b: Double? = 1.0
        XCTAssertEqual(a + b, 1.0)

        let c: Double? = nil
        let d: Double? = nil
        XCTAssertNil(c + d)

        let e: Double? = nil
        let f: Double? = 1.0
        XCTAssertEqual(e + f, 1.0)
    }

    func testCombileFloat() {
        let a: Float? = 0
        let b: Float? = 1.0
        XCTAssertEqual(a + b, 1.0)

        let c: Float? = nil
        let d: Float? = nil
        XCTAssertNil(c + d)

        let e: Float? = nil
        let f: Float? = 1.0
        XCTAssertEqual(e + f, 1.0)
    }

    func testSubtractInt() {
        let a: Int? = 0
        let b: Int? = 1
        XCTAssertEqual(a - b, -1)

        let c: Int? = nil
        let d: Int? = nil
        XCTAssertNil(c - d)

        let e: Int? = nil
        let f: Int? = 1
        XCTAssertEqual(e - f, -1)
    }

    func testSubtractDoule() {
        let a: Double? = 0
        let b: Double? = 1.0
        XCTAssertEqual(a - b, -1.0)

        let c: Double? = nil
        let d: Double? = nil
        XCTAssertNil(c - d)

        let e: Double? = nil
        let f: Double? = 1.0
        XCTAssertEqual(e - f, -1.0)
    }

    func testSubtractFloat() {
        let a: Float? = 0
        let b: Float? = 1.0
        XCTAssertEqual(a - b, -1.0)

        let c: Float? = nil
        let d: Float? = nil
        XCTAssertNil(c - d)

        let e: Float? = nil
        let f: Float? = 1.0
        XCTAssertEqual(e - f, -1.0)
    }

    func testMultiplieInt() {
        let a: Int? = 0
        let b: Int? = 1
        XCTAssertEqual(a * b, 0)

        let c: Int? = nil
        let d: Int? = nil
        XCTAssertNil(c * d)

        let e: Int? = nil
        let f: Int? = 1
        XCTAssertEqual(e * f, 1)
    }

    func testMultiplieDoule() {
        let a: Double? = 0
        let b: Double? = 1.0
        XCTAssertEqual(a * b, 0)

        let c: Double? = nil
        let d: Double? = nil
        XCTAssertNil(c * d)

        let e: Double? = nil
        let f: Double? = 1.0
        XCTAssertEqual(e * f, 1.0)
    }

    func testMultiplieFloat() {
        let a: Float? = 0
        let b: Float? = 1.0
        XCTAssertEqual(a * b, 0)

        let c: Float? = nil
        let d: Float? = nil
        XCTAssertNil(c * d)

        let e: Float? = nil
        let f: Float? = 1.0
        XCTAssertEqual(e * f, 1.0)
    }
}
