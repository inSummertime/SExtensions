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
        XCTAssertEqual("   Hello   world!   ".whitespaceCondensed, " Hello world! ")
    }
    
    func testNewlineCondensed() {
        XCTAssertEqual("\n\nHello\n\n\nworld!\n\n".newlineCondensed, "\nHello\nworld!\n")
    }
    
    func testUnderscoreCondensed() {
        XCTAssertEqual("__hello__world__".underscoreCondensed, "_hello_world_")
    }
    
    func testCondense() {
        XCTAssertEqual("Hello worrrrld!".condensing(text: "r"), "Hello world!")
        XCTAssertEqual("Helloooo wooorld!".condensing(text: "o"), "Hello world!")
    }
    
}
