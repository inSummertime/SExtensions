//
//  DateIntervalOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/5.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateIntervalOperatorTests: XCTestCase {
    
    func testGreaterThan() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
        let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
        XCTAssertTrue(nextDateInterval > dateInterval)
    }
    
    func testLessThanOrEqualTo() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
        let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
        XCTAssertTrue(dateInterval <= nextDateInterval)
        XCTAssertTrue(dateInterval <= DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1))
    }
    
    func testGreaterThanOrEqualTo() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
        let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
        XCTAssertTrue(nextDateInterval >= dateInterval)
        XCTAssertTrue(dateInterval >= DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1))
        XCTAssertTrue(DateInterval(start: Date(timeIntervalSinceReferenceDate: 2), duration: 1) >= dateInterval)
    }
    
    func testAnd() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
        let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
        XCTAssertEqual(dateInterval & nextDateInterval, dateInterval)
        XCTAssertEqual(dateInterval & DateInterval(start: Date(timeIntervalSinceReferenceDate: 1), duration: 0), DateInterval(start: Date(timeIntervalSinceReferenceDate: 1), duration: 0))
        XCTAssertNil(dateInterval & DateInterval(start: Date(timeIntervalSinceReferenceDate: 2), duration: 1))
    }
    
    func testOr() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1)
        let nextDateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2)
        XCTAssertEqual(dateInterval | nextDateInterval, nextDateInterval)
        XCTAssertEqual(nextDateInterval | dateInterval, nextDateInterval)
        XCTAssertEqual(dateInterval | DateInterval(start: Date(timeIntervalSinceReferenceDate: 1), duration: 0), dateInterval)
        XCTAssertNil(dateInterval | DateInterval(start: Date(timeIntervalSinceReferenceDate: 2), duration: 1))
    }
    
}
