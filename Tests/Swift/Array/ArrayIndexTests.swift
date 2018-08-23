//
//  ArrayIndexTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayIndexTests: XCTestCase {
    
    func testIndexesOf() {
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes(of: "hello"), [0, 3])
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes(of: "0"), [])
    }
    
    func testIndexesIsIncluded() {
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes( {$0.count == 5} ), [0, 1, 3, 4])
        XCTAssertEqual(["hello", "world", "!", "hello", "world", "!"].indexes( {$0.count == 2} ), [])
    }
    
}
