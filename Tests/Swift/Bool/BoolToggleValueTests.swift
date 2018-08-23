//
//  BoolToggleValueTests.swift
//  SExtensionsTests
//
//  Created by Ray on 7/14/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class BoolToggleValueTests: XCTestCase {
    
    func testToggleValue() {
        var bool: Bool = true
        bool.toggleValue()
        XCTAssertEqual(bool, false)
    }
    
}
