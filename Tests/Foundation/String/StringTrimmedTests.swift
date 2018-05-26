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
        let whitespaceHi = "   hi"
        XCTAssertEqual(whitespaceHi.trimmed, "hi")
        
        let hiWhitespace = "hi   "
        XCTAssertEqual(hiWhitespace.trimmed, "hi")
        
        let whitespaceHiWhitespace = "   hi   "
        XCTAssertEqual(whitespaceHiWhitespace.trimmed, "hi")
        
        let returnHi = "\nhi"
        XCTAssertEqual(returnHi.trimmed, "hi")
        
        let hiReturn = "hi\n"
        XCTAssertEqual(hiReturn.trimmed, "hi")
        
        let returnHiReturn = "\nhi\n"
        XCTAssertEqual(returnHiReturn.trimmed, "hi")
        
        let hiThere = "   hi   there   "
        XCTAssertEqual(hiThere.trimmed, "hi   there")
        
        let hiReturnThere = "hi\nthere"
        XCTAssertEqual(hiReturnThere.trimmed, "hi\nthere")
        
        let whitespaceHiReturnThereWhitespace = "   hi\nthere   "
        XCTAssertEqual(whitespaceHiReturnThereWhitespace.trimmed, "hi\nthere")
    }

}
