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
        let hithere = "hi there"
        let capitalizedHithere = hithere.firstLetterCapitalized
        XCTAssertEqual(capitalizedHithere, "Hi there")
    }
    
    func capitalizeFirstLetter() {
        var hi = "hi"
        hi.capitalizeFirstLetter()
        XCTAssertEqual(hi, "Hi")
    }
    
}
