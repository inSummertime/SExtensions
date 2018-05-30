//
//  StringCondenseTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringCondenseTests: XCTestCase {
    
    func testWhitespaceCondensed() {
        XCTAssertEqual("   hi   there   ".whitespaceCondensed, " hi there ")
    }
    
    func testNewlineCondensed() {
        XCTAssertEqual("\n\nhi\n\n\nthere\n\n".newlineCondensed, "\nhi\nthere\n")
    }
    
    func testUnderscoreCondensed() {
        XCTAssertEqual("__hi__there__".underscoreCondensed, "_hi_there_")
    }
    
    func testCondense() {
        XCTAssertEqual("hi theereee".condense(text: "e"), "hi there")
        XCTAssertEqual("hhhi thhhere".condense(text: "h"), "hi there")
    }
    
}
