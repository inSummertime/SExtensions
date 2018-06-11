//
//  StringDateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/2.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringDateTests: XCTestCase {
    
    func testToDate() {
        let timeUTC = "2018-06-02T00:00:00+0000"
        let dateFromTimeUTC = timeUTC.toDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
        XCTAssertNotNil(dateFromTimeUTC)
        let componentsOfDateFromTimeUTC = Calendar.current.dateComponents(in: TimeZone(identifier: "UTC")!, from: dateFromTimeUTC!)
        XCTAssertEqual(componentsOfDateFromTimeUTC.year!, 2018)
        XCTAssertEqual(componentsOfDateFromTimeUTC.month!, 6)
        XCTAssertEqual(componentsOfDateFromTimeUTC.day!, 2)
        XCTAssertEqual(componentsOfDateFromTimeUTC.hour!, 0)
        XCTAssertEqual(componentsOfDateFromTimeUTC.minute!, 0)
        XCTAssertEqual(componentsOfDateFromTimeUTC.second!, 0)
        
        let time = "2018-06-02 00:00:00"
        let dateFromTime = time.toDate(dateFormat: "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone(identifier: "UTC")!)
        XCTAssertNotNil(dateFromTime)
        let componentsOfDateFromTime = Calendar.current.dateComponents(in: TimeZone(identifier: "UTC")!, from: dateFromTime!)
        XCTAssertEqual(componentsOfDateFromTime.year!, 2018)
        XCTAssertEqual(componentsOfDateFromTime.month!, 6)
        XCTAssertEqual(componentsOfDateFromTime.day!, 2)
        XCTAssertEqual(componentsOfDateFromTime.hour!, 0)
        XCTAssertEqual(componentsOfDateFromTime.minute!, 0)
        XCTAssertEqual(componentsOfDateFromTime.second!, 0)
        
        let time1 = "2018-06-02 00:00:01"
        let dateFromTime1 = time1.toDate(dateFormat: "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone(identifier: "UTC")!)
        XCTAssertEqual(dateFromTime!.timeIntervalSince(dateFromTime1!), -1)
    }
    
}
