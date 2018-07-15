//
//  DateInitTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/15/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DateInitTests: XCTestCase {
    
    func testInit() {
        let date = Date(string: "2018.07.15 at 00:00:00 +0000", dateFormat: "yyyy.MM.dd 'at' HH:mm:ss Z", calendar: Calendar(identifier: Calendar.Identifier.gregorian))
        XCTAssertEqual(date!.description, "2018-07-15 00:00:00 +0000")
    }
    
}
