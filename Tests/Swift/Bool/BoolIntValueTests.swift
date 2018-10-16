//
//  BoolIntValueTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/11/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class BoolIntValueTests: XCTestCase {
    
    func testInt() {
        XCTAssertEqual(true.intValue, 1)
        XCTAssertEqual(false.intValue, 0)
    }
    
}
