//
//  TimeZoneUTCTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/13.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class TimeZoneUTCTests: XCTestCase {

    func testUTC() {
        XCTAssertEqual(TimeZone.UTC.identifier, "GMT")
    }

}
