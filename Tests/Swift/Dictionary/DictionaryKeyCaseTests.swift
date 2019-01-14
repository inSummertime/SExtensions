//
//  DictionaryKeyCaseTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/17.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class DictionaryKeyCaseTests: XCTestCase {

    func testUppercasingAllKeys() {
        XCTAssertEqual(["hello": 0, "world": 1].uppercasingAllKeys(), ["HELLO": 0, "WORLD": 1])
        XCTAssertEqual(["": 0].uppercasingAllKeys(), ["": 0])
        XCTAssertEqual(["!": 0].uppercasingAllKeys(), ["!": 0])
    }

    func testUppercaseAllKeys() {
        var helloWorld = ["hello": 0, "world": 1]
        helloWorld.uppercaseAllKeys()
        XCTAssertEqual(helloWorld, ["HELLO": 0, "WORLD": 1])
    }

    func testLowercasingAllKeys() {
        XCTAssertEqual(["HELLO": 0, "WORLD": 1].lowercasingAllKeys(), ["hello": 0, "world": 1])
        XCTAssertEqual(["": 0].lowercasingAllKeys(), ["": 0])
        XCTAssertEqual(["!": 0].lowercasingAllKeys(), ["!": 0])
    }

    func testLowercaseAllKeys() {
        var helloWorld = ["HELLO": 0, "WORLD": 1]
        helloWorld.lowercaseAllKeys()
        XCTAssertEqual(helloWorld, ["hello": 0, "world": 1])
    }

    func testCapitalizingAllKeys() {
        XCTAssertEqual(["hello world!": 0, "hi there!": 1].capitalizingAllKeys(), ["Hello World!": 0, "Hi There!": 1])
    }

    func testCapitalizeAllKeys() {
        var helloWorld = ["hello world!": 0, "hi there!": 1]
        helloWorld.capitalizeAllKeys()
        XCTAssertEqual(helloWorld, ["Hello World!": 0, "Hi There!": 1])
    }

    func testChangingAllKeysToSentenceCase() {
        XCTAssertEqual(["hello world!": 0, "hi there!": 1].changingAllKeysToSentenceCase(), ["Hello world!": 0, "Hi there!": 1])
    }

    func testChangeAllKeysToSentenceCase() {
        var helloWorld = ["hello world!": 0, "hi there!": 1]
        helloWorld.changeAllKeysToSentenceCase()
        XCTAssertEqual(helloWorld, ["Hello world!": 0, "Hi there!": 1])
    }

    func testChangingAllKeysToCamelCase() {
        XCTAssertEqual(["hello world!": 0, "hi there!": 1].changingAllKeysToCamelCase(), ["helloWorld!": 0, "hiThere!": 1])
    }

    func testChangeAllKeysToCamelCase() {
        var helloWorld = ["hello world!": 0, "hi there!": 1]
        helloWorld.changeAllKeysToCamelCase()
        XCTAssertEqual(helloWorld, ["helloWorld!": 0, "hiThere!": 1])
    }

    func testChangingAllKeysToSnakeCase() {
        XCTAssertEqual(["hello world!": 0, "hi there!": 1].changingAllKeysToSnakeCase(), ["hello_world!": 0, "hi_there!": 1])
    }

    func testChangeAllKeysToSnakeCase() {
        var helloWorld = ["hello world!": 0, "hi there!": 1]
        helloWorld.changeAllKeysToSnakeCase()
        XCTAssertEqual(helloWorld, ["hello_world!": 0, "hi_there!": 1])
    }
}
