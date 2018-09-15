//
//  StringIsTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringIsTests: XCTestCase {
    
    func testIsPhoneNumber() {
        XCTAssertTrue("800–692–7753".isPhoneNumber) // (800) MY–APPLE
        XCTAssertTrue("(877) 412–7753".isPhoneNumber) // Apple Enterprise Sales
        XCTAssertTrue("1–800–800–2775".isPhoneNumber) // Apple Store for Education Institutions
        XCTAssertTrue("1300-550-691".isPhoneNumber) // Australia Apple Government Sales
        XCTAssertTrue("(852) 800 908 988".isPhoneNumber) // Hong Kong Apple Online Store
        XCTAssertTrue("(852) 2112 0099".isPhoneNumber) // Hong Kong Technical Support
    }
    
    func testIsEmail() {
        XCTAssertTrue("123@a.com".isEmail)
        XCTAssertTrue("123@a.co.au".isEmail)
        XCTAssertFalse("123".isEmail)
        XCTAssertFalse("123@".isEmail)
        XCTAssertFalse("123@.".isEmail)
        XCTAssertFalse("123@.com".isEmail)
        XCTAssertFalse("123@com".isEmail)
    }
    
}
