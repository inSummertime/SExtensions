//
//  BoolToggleTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/12/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class BoolToggleTests: XCTestCase {
    
    func testToggle() {
        var bool = true
        bool.toggle()
        XCTAssertEqual(bool, false)
        XCTAssertEqual(bool.toggle(), true)
    }
    
}
