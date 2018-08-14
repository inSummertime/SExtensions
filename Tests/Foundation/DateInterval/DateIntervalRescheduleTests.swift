//
//  DateIntervalRescheduleTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateIntervalRescheduleTests: XCTestCase {
    
    func testMoving() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
        let nextDateInterval = dateInterval.moving(to: Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(60.0))
        XCTAssertEqual(nextDateInterval.start, Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(60.0))
        XCTAssertEqual(nextDateInterval.duration, 60.0)
    }
    
    func testProlonging() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
        let nextDateInterval = dateInterval.prolonging(timeInterval: 60.0)
        XCTAssertEqual(nextDateInterval.start, Date(timeIntervalSinceReferenceDate: 0))
        XCTAssertEqual(nextDateInterval.duration, 120.0)
    }
    
    func testEndingEarly() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)
        let nextDateInterval = dateInterval.endingEarly(timeInterval: 30.0)
        XCTAssertEqual(nextDateInterval.start, Date(timeIntervalSinceReferenceDate: 0))
        XCTAssertEqual(nextDateInterval.duration, 30.0)
    }
    
}
