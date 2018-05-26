//
//  StringFirstLetterCapitalizedTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/26.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringFirstLetterCapitalizedTests: XCTestCase {
    
    func testFirstLetterCapitalized() {
        let hi = "hi"
        let capitalizedHi = hi.firstLetterCapitalized
        XCTAssertEqual(capitalizedHi, "Hi")
        
        let h = "h"
        let capitalizedH = h.firstLetterCapitalized
        XCTAssertEqual(capitalizedH, "H")
        
        let hithere = "hi there"
        let capitalizedHithere = hithere.firstLetterCapitalized
        XCTAssertEqual(capitalizedHithere, "Hi there")
        
        let one = "1"
        let capitalizedOne = one.firstLetterCapitalized
        XCTAssertEqual(capitalizedOne, "1")
        
        let whitespace = " "
        let capitalizedWhitespace = whitespace.firstLetterCapitalized
        XCTAssertEqual(capitalizedWhitespace, " ")
        
        let dollar = "$1"
        let capitalizedDollar = dollar.firstLetterCapitalized
        XCTAssertEqual(capitalizedDollar, "$1")
    }
    
    func capitalizeFirstLetter() {
        var hi = "hi"
        hi.capitalizeFirstLetter()
        XCTAssertEqual(hi, "Hi")
        
        var h = "h"
        h.capitalizeFirstLetter()
        XCTAssertEqual(h, "H")
        
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
    
}
