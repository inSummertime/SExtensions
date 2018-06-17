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
    
    func testChangingToSentenseCase() {
        XCTAssertEqual(" h ".changingToSentenseCase(), "H")
        XCTAssertEqual("hello".changingToSentenseCase(), "Hello")
        XCTAssertEqual("hello world!".changingToSentenseCase(), "Hello world!")
        print("\n hello \nworld! \n".changingToSentenseCase())
        print("Hello \nworld!")
        XCTAssertEqual("\n hello \nworld! \n".changingToSentenseCase(), "Hello \nworld!")
        XCTAssertEqual(" ".changingToSentenseCase(), "")
        XCTAssertEqual(" $1 ".changingToSentenseCase(), "$1")
        XCTAssertEqual("".changingToSentenseCase(), "")
        XCTAssertEqual("Hello world".changingToSentenseCase(), "Hello world")
    }
    
    func testChangeToSentenseCase() {
        var h = " h "
        h.changeToSentenseCase()
        XCTAssertEqual(h, "H")
        
        var hello = "hello"
        hello.changeToSentenseCase()
        XCTAssertEqual(hello, "Hello")
        
        var helloWorld = "hello world!"
        helloWorld.changeToSentenseCase()
        XCTAssertEqual(helloWorld, "Hello world!")
        
        var one = "1"
        one.changeToSentenseCase()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.changeToSentenseCase()
        XCTAssertEqual(whitespace, "")
        
        var dollar = "$1"
        dollar.changeToSentenseCase()
        XCTAssertEqual(dollar, "$1")
        
        var empty = ""
        empty.changeToSentenseCase()
        XCTAssertEqual(empty, "")
    }
    
    func testChangingToCamelCase() {
        XCTAssertEqual(" h ".changingToCamelCase(), "h")
        XCTAssertEqual("hello".changingToCamelCase(), "hello")
        XCTAssertEqual("hello world!".changingToCamelCase(), "helloWorld!")
        XCTAssertEqual("\n hello \nworld! \n".changingToCamelCase(), "helloWorld!")
        XCTAssertEqual(" ".changingToCamelCase(), "")
        XCTAssertEqual(" $1 ".changingToCamelCase(), "$1")
        XCTAssertEqual("".changingToCamelCase(), "")
        XCTAssertEqual("helloWorld!".changingToCamelCase(), "helloWorld!")
    }
    
    func testChangeToCamelCase() {
        var h = " h "
        h.changeToCamelCase()
        XCTAssertEqual(h, "h")
        
        var hi = "hello"
        hi.changeToCamelCase()
        XCTAssertEqual(hi, "hello")
        
        var helloWold = "hello world!"
        helloWold.changeToCamelCase()
        XCTAssertEqual(helloWold, "helloWorld!")
        
        var newlineHelloWorld = "\n hello \nworld! \n"
        newlineHelloWorld.changeToCamelCase()
        XCTAssertEqual(newlineHelloWorld, "helloWorld!")
        
        var one = "1"
        one.changeToCamelCase()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.changeToCamelCase()
        XCTAssertEqual(whitespace, "")
        
        var dollar = "$1"
        dollar.changeToCamelCase()
        XCTAssertEqual(dollar, "$1")
        
        var empty = ""
        empty.changeToCamelCase()
        XCTAssertEqual(empty, "")
        
        var camelCasedHelloWorld = "helloWorld!"
        camelCasedHelloWorld.changeToCamelCase()
        XCTAssertEqual(camelCasedHelloWorld, "helloWorld!")
    }
    
    func testChangingToSnakeCase() {
        XCTAssertEqual(" h ".changingToSnakeCase(), "h")
        XCTAssertEqual("hello".changingToSnakeCase(), "hello")
        XCTAssertEqual("hello world!".changingToSnakeCase(), "hello_world!")
        XCTAssertEqual("\n hello \nworld! \n".changingToSnakeCase(), "hello_world!")
        XCTAssertEqual(" ".changingToSnakeCase(), "")
        XCTAssertEqual(" $1 ".changingToSnakeCase(), "$1")
        XCTAssertEqual("".changingToSnakeCase(), "")
        XCTAssertEqual("hello_world!".changingToSnakeCase(), "hello_world!")
    }
    
    func testChangeToSnakeCase() {
        var h = " h "
        h.changeToSnakeCase()
        XCTAssertEqual(h, "h")
        
        var hello = "hello"
        hello.changeToSnakeCase()
        XCTAssertEqual(hello, "hello")
        
        var helloWorld = "hello world!"
        helloWorld.changeToSnakeCase()
        XCTAssertEqual(helloWorld, "hello_world!")
        
        var newlineHelloWorld = "\n hello \nworld! \n"
        newlineHelloWorld.changeToSnakeCase()
        XCTAssertEqual(newlineHelloWorld, "hello_world!")
        
        var one = "1"
        one.changeToSnakeCase()
        XCTAssertEqual(one, "1")
        
        var whitespace = " "
        whitespace.changeToSnakeCase()
        XCTAssertEqual(whitespace, "")
        
        var dollar = "$1"
        dollar.changeToSnakeCase()
        XCTAssertEqual(dollar, "$1")
        
        var empty = ""
        empty.changeToSnakeCase()
        XCTAssertEqual(empty, "")
        
        var snakeCasedHelloWorld = "hello_world!"
        snakeCasedHelloWorld.changeToSnakeCase()
        XCTAssertEqual(snakeCasedHelloWorld, "hello_world!")
        
        var snakeCasedHelloWorldWithUnderscores = "_hello_world!_"
        snakeCasedHelloWorldWithUnderscores.changeToSnakeCase()
        XCTAssertEqual(snakeCasedHelloWorldWithUnderscores, "hello_world!")
    }
    
}
