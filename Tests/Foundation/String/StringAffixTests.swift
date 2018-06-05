//
//  StringAffixTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringAffixTests: XCTestCase {
    
    func testRemovingPrefix() {
        XCTAssertEqual("Hello world!".removingPrefix("H"), "ello world!")
        XCTAssertEqual("Hello world!".removingPrefix("e"), "Hello world!")
        XCTAssertEqual("Hello world!".removingPrefix("Hello"), " world!")
        XCTAssertEqual("Hello world!".removingPrefix(""), "Hello world!")
        XCTAssertEqual("Hello world!".removingPrefix(" "), "Hello world!")
        XCTAssertEqual("Hello world!".removingPrefix("Hello world!"), "")
        XCTAssertEqual("Hello world!".removingPrefix("Hello world! "), "Hello world!")
        XCTAssertEqual("HHello world!".removingPrefix("H"), "Hello world!")
        XCTAssertEqual("Hello-world!".removingPrefix("Hello"), "world!")
    }
    
    func testRemovePrefix() {
        var helloWorld = "Hello world!"
        helloWorld.removePrefix("H")
        XCTAssertEqual(helloWorld, "ello world!")
    }
    
    func testRemovingSuffix() {
        XCTAssertEqual("Hello world!".removingSuffex("!"), "Hello world")
        XCTAssertEqual("Hello world!".removingSuffex("d"), "Hello world!")
        XCTAssertEqual("Hello world!".removingSuffex("d!"), "Hello worl")
        XCTAssertEqual("Hello world!".removingSuffex(""), "Hello world!")
        XCTAssertEqual("Hello world!".removingSuffex(" "), "Hello world!")
        XCTAssertEqual("Hello world!".removingSuffex("Hello world!"), "")
        XCTAssertEqual("Hello world!".removingSuffex("Hello world! "), "Hello world!")
        XCTAssertEqual("Hello world!!".removingSuffex("!"), "Hello world!")
        XCTAssertEqual("Hello-world!".removingSuffex("world!"), "Hello")
    }
    
    func testRemoveSuffix() {
        var helloWorld = "Hello world!"
        helloWorld.removeSuffix("d!")
        XCTAssertEqual(helloWorld, "Hello worl")
    }
    
}
