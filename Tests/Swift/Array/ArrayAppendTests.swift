//
//  ArrayAppendTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/20.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayAppendTests: XCTestCase {

    func testAppendIfNotContains() {
        var array = [0, 1]
        XCTAssertEqual(array.appendIfNotContains(0), false)
        XCTAssertEqual(array, [0, 1])
        XCTAssertEqual(array.appendIfNotContains(2), true)
        XCTAssertEqual(array, [0, 1, 2])
    }
    
    func testAppendMaxCountOfElement() {
        var array = ["hello", "world", "!"]
        XCTAssertEqual(array.append("hello", maxCountOfElement: 1), false)
        XCTAssertEqual(array, ["hello", "world", "!"])
        XCTAssertEqual(array.append("!", maxCountOfElement: 2), true)
        XCTAssertEqual(array, ["hello", "world", "!", "!"])
    }

}
