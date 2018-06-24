//
//  ArraySafeSubscriptTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArraySafeSubscriptTests: XCTestCase {
    
    func testSafeSubscript() {
        XCTAssertNil(["hello"][safe: 1])
        XCTAssertEqual(["hello", "world"][safe: 1]!, "world")
    }
    
}
