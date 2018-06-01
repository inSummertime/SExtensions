//
//  StringTrimTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/1.
//  Copyright © 2018年 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringTrimTests: XCTestCase {
    
    func testTrimmed() {
        XCTAssertEqual("   hello   ".trimmed, "hello")
        XCTAssertEqual("\nhello\n".trimmed, "hello")
        XCTAssertEqual("   hello   world!   ".trimmed, "hello   world!")
        XCTAssertEqual("hello\nworld!".trimmed, "hello\nworld!")
        XCTAssertEqual("   hello\nworld!   ".trimmed, "hello\nworld!")
    }
    
    func testStartTrimmed() {
        XCTAssertEqual("   hello   ".startTrimmed, "hello   ")
        XCTAssertEqual("\nhello\n".startTrimmed, "hello\n")
        XCTAssertEqual("   hello   world!   ".startTrimmed, "hello   world!   ")
        XCTAssertEqual("hello\nworld!".startTrimmed, "hello\nworld!")
        XCTAssertEqual("   hello\nworld!   ".startTrimmed, "hello\nworld!   ")
    }
    
    func testEndTrimmed() {
        XCTAssertEqual("   hello   ".endTrimmed, "   hello")
        XCTAssertEqual("\nhello\n".endTrimmed, "\nhello")
        XCTAssertEqual("   hello   world!   ".endTrimmed, "   hello   world!")
        XCTAssertEqual("hello\nworld!".endTrimmed, "hello\nworld!")
        XCTAssertEqual("   hello\nworld!   ".endTrimmed, "   hello\nworld!")
    }
    
    func testWhitespaceTrimmed() {
        XCTAssertEqual("   hello   world!   ".whitespaceTrimmed, "hello   world!")
    }
    
    func textStartWhitespaceTrimmed() {
        XCTAssertEqual("   hello   world!   ".startWhitespaceTrimmed, "hello   world!")
    }
    
    func textEndWhitespaceTrimmed() {
        XCTAssertEqual("   hello   world!   ".endWhitespaceTrimmed, "   hello   world!")
    }
    
    func testNewlinesTrimmed() {
        XCTAssertEqual("\n\nhello\n\nworld!\n\n".newlineTrimmed, "hello\n\nworld!")
    }
    
    func testStartNewlineTrimmed() {
        XCTAssertEqual("\n\nhello\n\nworld!\n\n".startNewlineTrimmed, "hello\n\nworld!\n\n")
    }
    
    func testEndNewlineTrimmed() {
        XCTAssertEqual("\n\nhello\n\nworld!\n\n".endNewlineTrimmed, "\n\nhello\n\nworld!")
    }
    
    func testTrimmingStartCharacters() {
        XCTAssertEqual("!Hello world!".trimmingStartCharacters(in: .punctuationCharacters), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingStartCharacters(in: .punctuationCharacters), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingStartCharacters(in: .symbols), "Hello world!")
    }
    
    func testTrimmingEndCharacters() {
        XCTAssertEqual("Hello world!".trimmingEndCharacters(in: .punctuationCharacters), "Hello world")
        XCTAssertEqual("!Hello world".trimmingEndCharacters(in: .punctuationCharacters), "!Hello world")
        XCTAssertEqual("Hello world!".trimmingEndCharacters(in: .symbols), "Hello world!")
    }
    
    func testTrimText() {
        XCTAssertEqual("Hello world!".trim(text: "l"), "Heo word!")
        XCTAssertEqual("Hello world!".trim(text: "Hello"), " world!")
        XCTAssertEqual("Hello world!".trim(text: ""), "Hello world!")
        XCTAssertEqual("Hello world!".trim(text: " "), "Helloworld!")
        XCTAssertEqual("Hello world!".trim(text: "Hello world!"), "")
        XCTAssertEqual("Hello world!".trim(text: "Hello world! "), "Hello world!")
    }
    
    func testTrimStart() {
        XCTAssertEqual("Hello world!".trimStart(text: "H"), "ello world!")
        XCTAssertEqual("Hello world!".trimStart(text: "e"), "Hello world!")
        XCTAssertEqual("Hello world!".trimStart(text: "Hello"), " world!")
        XCTAssertEqual("Hello world!".trimStart(text: ""), "Hello world!")
        XCTAssertEqual("Hello world!".trimStart(text: " "), "Hello world!")
        XCTAssertEqual("Hello world!".trimStart(text: "Hello world!"), "")
        XCTAssertEqual("Hello world!".trimStart(text: "Hello world! "), "Hello world!")
    }
    
    func testTrimEnd() {
        XCTAssertEqual("Hello world!".trimEnd(text: "!"), "Hello world")
        XCTAssertEqual("Hello world!".trimEnd(text: "d"), "Hello world!")
        XCTAssertEqual("Hello world!".trimEnd(text: "d!"), "Hello worl")
        XCTAssertEqual("Hello world!".trimEnd(text: ""), "Hello world!")
        XCTAssertEqual("Hello world!".trimEnd(text: " "), "Hello world!")
        XCTAssertEqual("Hello world!".trimEnd(text: "Hello world!"), "")
        XCTAssertEqual("Hello world!".trimEnd(text: "Hello world! "), "Hello world!")
    }
    
}
