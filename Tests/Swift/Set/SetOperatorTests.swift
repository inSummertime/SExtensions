//
//  SetOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/4.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class SetOperatorTests: XCTestCase {

    func testOrOperator() {
        let set: Set = ["hello", "world"]
        XCTAssertEqual(set | ["!"], ["hello", "world", "!"])
    }
    
    func testSubtractionOperator() {
        let set: Set = ["hello"]
        XCTAssertEqual(set - ["world"], ["hello"])
        XCTAssertEqual(set - ["hello", "world"], [])
        XCTAssertEqual(set - [], ["hello"])
        XCTAssertEqual(set - ["hello"], [])
    }
    
    func testSubtractionAssignmentOperator() {
        var hello: Set = ["hello", "world"]
        hello -= ["world"]
        XCTAssertEqual(hello, ["hello"])
        hello -= []
        XCTAssertEqual(hello, ["hello"])
        hello -= ["hello", "world"]
        XCTAssertEqual(hello, [])
    }
    
    func testAndOperator() {
        let set: Set = ["hello"]
        XCTAssertEqual(set & ["world"], [])
        XCTAssertEqual(set & ["hello", "world"], ["hello"])
        XCTAssertEqual(set & [], [])
    }

}
