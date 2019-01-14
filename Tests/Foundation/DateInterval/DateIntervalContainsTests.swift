//
//  DateIntervalContainsTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/10.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DateIntervalContainsTests: XCTestCase {

    func testContains() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 2.0)
        XCTAssertTrue(dateInterval.contains(dateInterval))
        XCTAssertTrue(dateInterval.contains(DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 1.0)))
        XCTAssertTrue(dateInterval.contains(DateInterval(start: Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(1.0), duration: 1.0)))
        XCTAssertFalse(dateInterval.contains(DateInterval(start: Date(timeIntervalSinceReferenceDate: 0).addingTimeInterval(2.0), duration: 1.0)))
    }
}
