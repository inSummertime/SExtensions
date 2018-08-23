//
//  BoolIntTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/11/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class BoolIntTests: XCTestCase {
    
    func testInt() {
        XCTAssertEqual(true.int, 1)
        XCTAssertEqual(false.int, 0)
    }
    
}
