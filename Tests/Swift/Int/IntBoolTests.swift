//
//  IntBoolTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class IntBoolTests: XCTestCase {
    
    func testBool() {
        XCTAssertTrue(1.bool)
        XCTAssertFalse(0.bool)
        XCTAssertFalse((-1).bool)
        XCTAssertFalse(2.bool)
    }
    
}
