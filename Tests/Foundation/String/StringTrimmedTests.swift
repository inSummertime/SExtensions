//
//  StringTrimmedTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/27.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringTrimmedTests: XCTestCase {
    
    func testTrimmed() {
        XCTAssertEqual("   hi   ".trimmed, "hi")
        XCTAssertEqual("\nhi\n".trimmed, "hi")
        XCTAssertEqual("   hi   there   ".trimmed, "hi   there")
        XCTAssertEqual("hi\nthere".trimmed, "hi\nthere")
        XCTAssertEqual("   hi\nthere   ".trimmed, "hi\nthere")
    }
    
    func testWhitespaceTrimmed() {
        XCTAssertEqual("   hi   there   ".whitespaceTrimmed, "hi   there")
    }
    
    func testNewlinesTrimmed() {
        XCTAssertEqual("\n\nhi\n\nthere\n\n".newlineTrimmed, "hi\n\nthere")
    }

}
