//
//  StringWordsTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/5/30.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringWordsTests: XCTestCase {
    
    func testWords() {
        XCTAssertEqual("hi".words, ["hi"])
        XCTAssertEqual("hiThere!".words, ["hi", "there!"])
        XCTAssertEqual("hi There!".words, ["hi", "there!"])
        XCTAssertEqual("hi There!*2".words, ["hi", "there!*2"])
        XCTAssertEqual("2 hi There!".words, ["2", "hi", "there!"])
        XCTAssertEqual("hi_there".words, ["hi_there"])
        XCTAssertEqual("hi-there".words, ["hi-there"])
        XCTAssertEqual("hi-There".words, ["hi-", "there"])
        XCTAssertEqual("".words, [])
        XCTAssertEqual("   \n".words, [])
        XCTAssertEqual("hi\nthere".words, ["hi", "there"])
    }
    
    func testWordCount() {
        XCTAssertEqual("hi".wordCount, 1)
        XCTAssertEqual("hiThere!".wordCount, 2)
        XCTAssertEqual("hi There!".wordCount, 2)
        XCTAssertEqual("hi There!*2".wordCount, 2)
        XCTAssertEqual("2 hi There!".wordCount, 3)
        XCTAssertEqual("hi_there".wordCount, 1)
        XCTAssertEqual("hi-there".wordCount, 1)
        XCTAssertEqual("hi-There".wordCount, 2)
        XCTAssertEqual("".wordCount, 0)
        XCTAssertEqual("   \n".wordCount, 0)
        XCTAssertEqual("hi\nthere".wordCount, 2)
    }
    
}
