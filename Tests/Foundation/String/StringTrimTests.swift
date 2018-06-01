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
    
    func testTrimmingText() {
        XCTAssertEqual("Hello world!".trimming(text: "l"), "Heo word!")
        XCTAssertEqual("Hello world!".trimming(text: "Hello"), " world!")
        XCTAssertEqual("Hello world!".trimming(text: ""), "Hello world!")
        XCTAssertEqual("Hello world!".trimming(text: " "), "Helloworld!")
        XCTAssertEqual("Hello world!".trimming(text: "Hello world!"), "")
        XCTAssertEqual("Hello world!".trimming(text: "Hello world! "), "Hello world!")
    }
    
    func testTrimText() {
        var helloWorld = "Hello world!"
        helloWorld.trim(text: "l")
        XCTAssertEqual(helloWorld, "Heo word!")
    }
    
    func testTrimmingStartText() {
        XCTAssertEqual("Hello world!".trimmingStart(text: "H"), "ello world!")
        XCTAssertEqual("Hello world!".trimmingStart(text: "e"), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingStart(text: "Hello"), " world!")
        XCTAssertEqual("Hello world!".trimmingStart(text: ""), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingStart(text: " "), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingStart(text: "Hello world!"), "")
        XCTAssertEqual("Hello world!".trimmingStart(text: "Hello world! "), "Hello world!")
    }
    
    func testTrimStartText() {
        var helloWorld = "Hello world!"
        helloWorld.trimStart(text: "H")
        XCTAssertEqual(helloWorld, "ello world!")
    }
    
    func testTrimmingEndText() {
        XCTAssertEqual("Hello world!".trimmingEnd(text: "!"), "Hello world")
        XCTAssertEqual("Hello world!".trimmingEnd(text: "d"), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingEnd(text: "d!"), "Hello worl")
        XCTAssertEqual("Hello world!".trimmingEnd(text: ""), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingEnd(text: " "), "Hello world!")
        XCTAssertEqual("Hello world!".trimmingEnd(text: "Hello world!"), "")
        XCTAssertEqual("Hello world!".trimmingEnd(text: "Hello world! "), "Hello world!")
    }
    
    func testTrimEndText() {
        var helloWorld = "Hello world!"
        helloWorld.trimEnd(text: "d!")
        XCTAssertEqual(helloWorld, "Hello worl")
    }
    
}
