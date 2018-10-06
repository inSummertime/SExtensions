//
//  SetHasTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class SetHasTests: XCTestCase {

    func testHasAny() {
        let set: Set = ["hello", "world", "!"]
        XCTAssertTrue(set.hasAny({ $0.count == 5}))
    }
    
    func testHasAll() {
        let set: Set = ["hello", "world", "!"]
        XCTAssertFalse(set.hasAll({ $0.count == 5}))
        let anotherSet: Set = ["hello", "world"]
        XCTAssertTrue(anotherSet.hasAll({ $0.count == 5}))
    }

}
