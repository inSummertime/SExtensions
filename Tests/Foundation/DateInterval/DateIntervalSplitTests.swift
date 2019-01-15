//
//  DateIntervalSplitTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/9.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DateIntervalSplitTests: XCTestCase {

    func testSplit() {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: 60.0)

        XCTAssertEqual(dateInterval.split(with: 61.0).count, 0)
        XCTAssertEqual(dateInterval.split(with: 60.0).count, 1)

        let dateIntervals = dateInterval.split(with: 7.0)
        XCTAssertEqual(dateIntervals.count, 8)
        XCTAssertEqual(dateIntervals[7], DateInterval(start: Date(timeIntervalSinceReferenceDate: 49.0), duration: 7.0))

        let dateIntervalsWithMaxSplits = dateInterval.split(with: 7.0, maxSplits: 2)
        XCTAssertEqual(dateIntervalsWithMaxSplits.count, 2)
        XCTAssertEqual(dateIntervals[1], DateInterval(start: Date(timeIntervalSinceReferenceDate: 7.0), duration: 7.0))

        let dateIntervalsWithMaxSplitsAndOmittingInsufficientDateInterval = dateInterval.split(with: 7.0, maxSplits: 9, omittingInsufficientDateInterval: false)
        XCTAssertEqual(dateIntervalsWithMaxSplitsAndOmittingInsufficientDateInterval.count, 9)
        XCTAssertEqual(dateIntervalsWithMaxSplitsAndOmittingInsufficientDateInterval[8], DateInterval(start: Date(timeIntervalSinceReferenceDate: 56), duration: 4.0))

        let dateIntervalsWithZeroDuration = dateInterval.split(with: 0)
        XCTAssertEqual(dateIntervalsWithZeroDuration.count, 60)
        XCTAssertEqual(dateIntervalsWithZeroDuration[59], DateInterval(start: Date(timeIntervalSinceReferenceDate: 59.0), duration: 0))
    }
}
