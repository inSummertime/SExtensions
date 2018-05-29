//
//  StringCaseTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/29.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringCaseTests: XCTestCase {
    
    func testIsUppercase() {
        XCTAssertFalse("Hi".isUppercase)
        XCTAssertTrue("HI".isUppercase)
        XCTAssertFalse("hi".isUppercase)
        XCTAssertTrue("HI THERE!".isUppercase)
        XCTAssertFalse("hi there!".isUppercase)
        XCTAssertTrue(" $1 ".isUppercase)
    }
    
    func testIsLowercase() {
        XCTAssertFalse("Hi".isLowercase)
        XCTAssertFalse("HI".isLowercase)
        XCTAssertTrue("hi".isLowercase)
        XCTAssertFalse("HI THERE!".isLowercase)
        XCTAssertTrue("hi there!".isLowercase)
        XCTAssertTrue(" $1 ".isLowercase)
    }
    
    func testIsCapitalized() {
        XCTAssertTrue("Hi".isCapitalized)
        XCTAssertFalse("HI".isCapitalized)
        XCTAssertFalse("hi".isCapitalized)
        XCTAssertTrue("Hi There!".isCapitalized)
        XCTAssertFalse("HI THERE!".isCapitalized)
        XCTAssertFalse("hi there!".isCapitalized)
        XCTAssertFalse("Hi there!".isCapitalized)
        XCTAssertTrue(" $1 ".isCapitalized)
    }
    
    func testSentensecased() {
        XCTAssertEqual(" h ".sentenseCased, "H")
        XCTAssertEqual("hi".sentenseCased, "Hi")
        XCTAssertEqual("hi there".sentenseCased, "Hi there")
        XCTAssertEqual("\n hi \nthere! \n".sentenseCased, "Hi \nthere!")
        XCTAssertEqual(" ".sentenseCased, "")
        XCTAssertEqual(" $1 ".sentenseCased, "$1")
    }
    
    func capitalizeFirstLetter() {
        var h = " h "
        h.capitalizeFirstLetter()
        XCTAssertEqual(h, "H")
        
        var hi = "hi"
        hi.capitalizeFirstLetter()
        XCTAssertEqual(hi, "Hi")
        
        var hithere = "hi there"
        hithere.capitalizeFirstLetter()
        XCTAssertEqual(hithere, "Hi there")
        
        var one = "1"
        one.capitalizeFirstLetter()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.capitalizeFirstLetter()
        XCTAssertEqual(whitespace, " ")
        
        var dollar = "$1"
        dollar.capitalizeFirstLetter()
        XCTAssertEqual(dollar, "$1")
    }
    
    func testCamelcased() {
        XCTAssertEqual(" h ".camelCased, "h")
        XCTAssertEqual("hi".camelCased, "hi")
        XCTAssertEqual("hi there".camelCased, "hiThere")
        XCTAssertEqual("\n hi \nthere! \n".camelCased, "hiThere!")
        XCTAssertEqual(" ".camelCased, "")
        XCTAssertEqual(" $1 ".camelCased, "$1")
    }
    
    func testToCamelcase() {
        var h = " h "
        h.toCamelCase()
        XCTAssertEqual(h, "h")
        
        var hi = "hi"
        hi.toCamelCase()
        XCTAssertEqual(hi, "hi")
        
        var hithere = "hi there"
        hithere.toCamelCase()
        XCTAssertEqual(hithere, "hiThere")
        
        var hiThere = "\n hi \nthere! \n"
        hiThere.toCamelCase()
        XCTAssertEqual(hiThere, "hiThere!")
        
        var one = "1"
        one.toCamelCase()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.toCamelCase()
        XCTAssertEqual(whitespace, "")
        
        var dollar = "$1"
        dollar.toCamelCase()
        XCTAssertEqual(dollar, "$1")
    }
    
}
