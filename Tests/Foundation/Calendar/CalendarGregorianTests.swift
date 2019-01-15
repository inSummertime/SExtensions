//
//  CalendarGregorianTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/15.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CalendarGregorianTests: XCTestCase {

    func testGregorian() {
        XCTAssertEqual(Calendar.gregorian.identifier, Calendar.Identifier.gregorian)
    }
}
