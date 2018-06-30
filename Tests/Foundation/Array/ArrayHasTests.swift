//
//  ArrayHasTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayHasTests: XCTestCase {
    
    func testHasAny() {
        XCTAssertTrue(["hello", "world", "!"].hasAny({ $0.count == 5}))
    }
    
    func testHasAll() {
        XCTAssertFalse(["hello", "world", "!"].hasAll({ $0.count == 5}))
        XCTAssertTrue(["hello", "world"].hasAll({ $0.count == 5}))
    }
    
}
