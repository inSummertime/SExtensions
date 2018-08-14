//
//  IntIsTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class IntIsTests: XCTestCase {
    
    func testIsEven() {
        XCTAssertTrue(0.isEven)
        XCTAssertTrue(2.isEven)
        XCTAssertTrue(4.isEven)
    }
    
    func testIsOdd() {
        XCTAssertTrue(1.isOdd)
        XCTAssertTrue(3.isOdd)
    }
    
}
