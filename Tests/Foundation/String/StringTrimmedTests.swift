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
        let text = "   hi   "
        XCTAssertEqual(text.trimmed, "hi")
    }

}
