//
//  NSAttributedStringConcatenateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class NSAttributedStringConcatenateTests: XCTestCase {
    
    func testConcatenate() {
        let hello = NSAttributedString(string: "Hello")
        let world = NSAttributedString(string: " world!")
        XCTAssertEqual((hello + world).string, "Hello world!")
    }
    
}
