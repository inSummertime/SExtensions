//
//  ArraySplitTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/28.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArraySplitTests: XCTestCase {

    func testSplitEvery() {
        XCTAssertEqual([0, 1, 2, 3, 4, 5, 6, 7].spliting(by: 3), [[0, 1, 2], [3, 4, 5], [6, 7]])
        XCTAssertEqual(["hello", "world", "!", " ", ""].spliting(by: 2), [["hello", "world"], ["!", " "], [""]])
    }

}
