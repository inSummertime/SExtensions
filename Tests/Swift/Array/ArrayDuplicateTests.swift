//
//  ArrayDuplicateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/21.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class ArrayDuplicateTests: XCTestCase {

    func testDuplicates() {
        XCTAssertEqual([0, 1, 2, 2, 3, 3].duplicates, [2, 3])
        XCTAssertEqual(["hello", "world"].duplicates, [])
        XCTAssertEqual([Double]().duplicates, [])
    }

    func testDuplicateArray() {
        XCTAssertEqual([0, 0, 1, 2, 2, 3, 0, 2].duplicateArray, [0, 0, 2, 2, 0, 2])
        XCTAssertEqual(["hello", "world"].duplicateArray, [])
        XCTAssertEqual([Double]().duplicateArray, [])
    }
}
