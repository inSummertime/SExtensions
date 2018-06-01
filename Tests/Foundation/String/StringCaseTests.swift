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
        XCTAssertFalse("Hello".isUppercase)
        XCTAssertTrue("HELLO".isUppercase)
        XCTAssertFalse("hello".isUppercase)
        XCTAssertTrue("HELLO WORLD!".isUppercase)
        XCTAssertFalse("hello world!".isUppercase)
        XCTAssertTrue(" $1 ".isUppercase)
        XCTAssertTrue("".isUppercase)
    }
    
    func testIsLowercase() {
        XCTAssertFalse("Hello".isLowercase)
        XCTAssertFalse("HELLO".isLowercase)
        XCTAssertTrue("hello".isLowercase)
        XCTAssertFalse("HELLO WORLD!".isLowercase)
        XCTAssertTrue("hello world!".isLowercase)
        XCTAssertTrue(" $1 ".isLowercase)
        XCTAssertTrue("".isLowercase)
    }
    
    func testIsCapitalized() {
        XCTAssertTrue("Hello".isCapitalized)
        XCTAssertFalse("HELLO".isCapitalized)
        XCTAssertFalse("hello".isCapitalized)
        XCTAssertTrue("Hello World!".isCapitalized)
        XCTAssertFalse("HELLO WORLD!".isCapitalized)
        XCTAssertFalse("hello world!".isCapitalized)
        XCTAssertFalse("Hello world!".isCapitalized)
        XCTAssertTrue(" $1 ".isCapitalized)
        XCTAssertTrue("".isCapitalized)
    }
    
    func testSentensecased() {
        XCTAssertEqual(" h ".sentenseCased, "H")
        XCTAssertEqual("hello".sentenseCased, "Hello")
        XCTAssertEqual("hello world!".sentenseCased, "Hello world!")
        print("\n hello \nworld! \n".sentenseCased)
        print("Hello \nworld!")
        XCTAssertEqual("\n hello \nworld! \n".sentenseCased, "Hello \nworld!")
        XCTAssertEqual(" ".sentenseCased, "")
        XCTAssertEqual(" $1 ".sentenseCased, "$1")
        XCTAssertEqual("".sentenseCased, "")
        XCTAssertEqual("Hello world".sentenseCased, "Hello world")
    }
    
    func capitalizeFirstLetter() {
        var h = " h "
        h.capitalizeFirstLetter()
        XCTAssertEqual(h, "H")
        
        var hello = "hello"
        hello.capitalizeFirstLetter()
        XCTAssertEqual(hello, "Hello")
        
        var helloWorld = "hello world!"
        helloWorld.capitalizeFirstLetter()
        XCTAssertEqual(helloWorld, "Hello world!")
        
        var one = "1"
        one.capitalizeFirstLetter()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.capitalizeFirstLetter()
        XCTAssertEqual(whitespace, " ")
        
        var dollar = "$1"
        dollar.capitalizeFirstLetter()
        XCTAssertEqual(dollar, "$1")
        
        var empty = ""
        empty.capitalizeFirstLetter()
        XCTAssertEqual(empty, "")
    }
    
    func testCamelcased() {
        XCTAssertEqual(" h ".camelCased, "h")
        XCTAssertEqual("hello".camelCased, "hello")
        XCTAssertEqual("hello world!".camelCased, "helloWorld!")
        XCTAssertEqual("\n hello \nworld! \n".camelCased, "helloWorld!")
        XCTAssertEqual(" ".camelCased, "")
        XCTAssertEqual(" $1 ".camelCased, "$1")
        XCTAssertEqual("".camelCased, "")
        XCTAssertEqual("helloWorld!".camelCased, "helloWorld!")
    }
    
    func testToCamelCase() {
        var h = " h "
        h.toCamelCase()
        XCTAssertEqual(h, "h")
        
        var hi = "hello"
        hi.toCamelCase()
        XCTAssertEqual(hi, "hello")
        
        var helloWold = "hello world!"
        helloWold.toCamelCase()
        XCTAssertEqual(helloWold, "helloWorld!")
        
        var newlineHelloWorld = "\n hello \nworld! \n"
        newlineHelloWorld.toCamelCase()
        XCTAssertEqual(newlineHelloWorld, "helloWorld!")
        
        var one = "1"
        one.toCamelCase()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.toCamelCase()
        XCTAssertEqual(whitespace, "")
        
        var dollar = "$1"
        dollar.toCamelCase()
        XCTAssertEqual(dollar, "$1")
        
        var empty = ""
        empty.toCamelCase()
        XCTAssertEqual(empty, "")
        
        var camelCasedHelloWorld = "helloWorld!"
        camelCasedHelloWorld.toCamelCase()
        XCTAssertEqual(camelCasedHelloWorld, "helloWorld!")
    }
    
    func testSnakeCased() {
        XCTAssertEqual(" h ".snakeCased, "h")
        XCTAssertEqual("hello".snakeCased, "hello")
        XCTAssertEqual("hello world!".snakeCased, "hello_world!")
        XCTAssertEqual("\n hello \nworld! \n".snakeCased, "hello_world!")
        XCTAssertEqual(" ".snakeCased, "")
        XCTAssertEqual(" $1 ".snakeCased, "$1")
        XCTAssertEqual("".snakeCased, "")
        XCTAssertEqual("hello_world!".snakeCased, "hello_world!")
    }
    
    func testToSnakeCase() {
        var h = " h "
        h.toSnakeCase()
        XCTAssertEqual(h, "h")
        
        var hello = "hello"
        hello.toSnakeCase()
        XCTAssertEqual(hello, "hello")
        
        var helloWorld = "hello world!"
        helloWorld.toSnakeCase()
        XCTAssertEqual(helloWorld, "hello_world!")
        
        var newlineHelloWorld = "\n hello \nworld! \n"
        newlineHelloWorld.toSnakeCase()
        XCTAssertEqual(newlineHelloWorld, "hello_world!")
        
        var one = "1"
        one.toSnakeCase()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.toSnakeCase()
        XCTAssertEqual(whitespace, "")
        
        var dollar = "$1"
        dollar.toSnakeCase()
        XCTAssertEqual(dollar, "$1")
        
        var empty = ""
        empty.toSnakeCase()
        XCTAssertEqual(empty, "")
        
        var snakeCasedHelloWorld = "hello_world!"
        snakeCasedHelloWorld.toSnakeCase()
        XCTAssertEqual(snakeCasedHelloWorld, "hello_world!")
        
        var snakeCasedHelloWorldWithUnderscores = "_hello_world!_"
        snakeCasedHelloWorldWithUnderscores.toSnakeCase()
        XCTAssertEqual(snakeCasedHelloWorldWithUnderscores, "hello_world!")
    }
    
}
