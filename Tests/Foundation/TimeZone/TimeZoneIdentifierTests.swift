//
//  TimeZoneIdentifierTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/13.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class TimeZoneIdentifierTests: XCTestCase {

    func testIdentifier() {
        XCTAssertEqual(TimeZone.Identifier.America.losAngeles.rawValue, "America/Los_Angeles")
        XCTAssertNotNil(TimeZone(identifier: TimeZone.Identifier.America.losAngeles.rawValue))
        XCTAssertEqual(TimeZone.Identifier.America.Argentina.buenosAires.rawValue, "America/Argentina/Buenos_Aires")
        XCTAssertNotNil(TimeZone(identifier: TimeZone.Identifier.America.Argentina.buenosAires.rawValue))
        XCTAssertEqual(TimeZone.Identifier.GMT.rawValue, "GMT")
        XCTAssertNotNil(TimeZone(identifier: TimeZone.Identifier.GMT.rawValue))
        print(TimeZone.UTC.identifier)
    }

}
