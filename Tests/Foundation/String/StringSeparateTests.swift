//
//  StringSeparateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringSeparateTests: XCTestCase {
    
    func testUppercaseLetterSeparated() {
        XCTAssertEqual("hiThere".uppercaseLetterSeparated, "hi There")
    }
    
    func testNewlineSeparated() {
        print("\nhi\nthere\n".newlineSeparated)
        XCTAssertEqual("\nhi\nthere\n".newlineSeparated, "hi \nthere")
    }
    
    func testSeparateByText() {
        XCTAssertEqual("hiThere".separate(by: "t"), "hiThere")
        XCTAssertEqual("hiThere".separate(by: "T"), "hi There")
    }
    
    func testSeparateByCharacterSet() {
        XCTAssertEqual("hi-there".separate(by: .punctuationCharacters), "hi -there")
    }
    
}
