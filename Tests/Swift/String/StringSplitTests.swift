//
//  StringSplitTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringSplitTests: XCTestCase {
    
    func testSplitingByLength() {
        XCTAssertEqual("Hello World!".spliting(by: 6), ["Hello ", "World!"])
        XCTAssertEqual("HelloWorld!".spliting(by: 3), ["Hel", "loW", "orl", "d!"])
        XCTAssertEqual("".spliting(by: 1), [])
    }
    
    func testSplitingByCapitalLetters() {
        XCTAssertEqual("Hello World!".splitingByCapitalLettersOrPunctuation(), ["Hello", "World", "!"])
        XCTAssertEqual("HelloWorld".splitingByCapitalLettersOrPunctuation(), ["Hello", "World"])
        XCTAssertEqual("".splitingByCapitalLettersOrPunctuation(), [])
    }
    
}
