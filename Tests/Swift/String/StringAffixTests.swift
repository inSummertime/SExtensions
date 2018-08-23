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
    
    func testRemovingPrefixCount() {
        XCTAssertEqual("Hello world!".removingPrefix(1), "ello world!")
        XCTAssertEqual("Hello world!".removingPrefix(100), "")
    }
    
    func testRemovePrefixCount() {
        var helloWorld = "Hello world!"
        helloWorld.removePrefix(1)
        XCTAssertEqual(helloWorld, "ello world!")
        helloWorld.removePrefix(100)
        XCTAssertEqual(helloWorld, "")
    }
    
    func testRemovingSuffix() {
        XCTAssertEqual("Hello world!".removingSuffix("!"), "Hello world")
        XCTAssertEqual("Hello world!".removingSuffix("d"), "Hello world!")
        XCTAssertEqual("Hello world!".removingSuffix("d!"), "Hello worl")
        XCTAssertEqual("Hello world!".removingSuffix(""), "Hello world!")
        XCTAssertEqual("Hello world!".removingSuffix(" "), "Hello world!")
        XCTAssertEqual("Hello world!".removingSuffix("Hello world!"), "")
        XCTAssertEqual("Hello world!".removingSuffix("Hello world! "), "Hello world!")
        XCTAssertEqual("Hello world!!".removingSuffix("!"), "Hello world!")
        XCTAssertEqual("Hello-world!".removingSuffix("world!"), "Hello")
    }
    
    func testRemoveSuffix() {
        var helloWorld = "Hello world!"
        helloWorld.removeSuffix("d!")
        XCTAssertEqual(helloWorld, "Hello worl")
    }
    
    func testRemovingSuffixCount() {
        XCTAssertEqual("Hello world!".removingSuffix(1), "Hello world")
        XCTAssertEqual("Hello world!".removingSuffix(100), "")
    }
    
    func testRemoveSuffixCount() {
        var helloWorld = "Hello world!"
        helloWorld.removeSuffix(1)
        XCTAssertEqual(helloWorld, "Hello world")
        helloWorld.removeSuffix(100)
        XCTAssertEqual(helloWorld, "")
    }
    
}
