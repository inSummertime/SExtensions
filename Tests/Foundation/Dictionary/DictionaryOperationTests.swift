//
//  DictionaryOperationTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DictionaryOperationTests: XCTestCase {
    
    func testUnion() {
        XCTAssertEqual(["hello": 0].union(["world": 1]), ["hello": 0, "world": 1])
        XCTAssertEqual(["hello": 0].union(["hello": 1]), ["hello": 1])
        XCTAssertEqual(["hello": 0].union(["hello": 1]).union(["": 1]), ["hello": 1, "": 1])
        XCTAssertEqual([0: 0].union([1: 1]), [0: 0, 1: 1])
        XCTAssertEqual([0: 0].union([:]), [0: 0])
        XCTAssertEqual([0: 0].union([1: 1], [2: 2, 3: 3]).union([:], [4: 4, 5: 5, 6: 6]), [0: 0, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6])
    }
    
    func testFromUnion() {
        var hello = ["hello": 0]
        hello.fromUnion(["hello": 1])
        XCTAssertEqual(hello, ["hello": 1])
        hello.fromUnion(["world": 1])
        XCTAssertEqual(hello, ["hello": 1, "world": 1])
        hello.fromUnion([:])
        XCTAssertEqual(hello, ["hello": 1, "world": 1])
        hello.fromUnion([:], ["hello": 0], ["world": 1], ["hello": 1, "world": 0])
        XCTAssertEqual(hello, ["hello": 1, "world": 0])
    }
    
    func testIntersection() {
        XCTAssertEqual(["hello": 0].intersection(["world": 1]), [:])
        XCTAssertEqual(["hello": 0].intersection(["hello": 0, "world": 1]), ["hello": 0])
        XCTAssertEqual(["hello": 0].intersection(["hello": 1, "world": 1]), [:])
        XCTAssertEqual(["hello": 0].intersection([:]), [:])
    }
    
    func testSubtracting() {
        XCTAssertEqual(["hello": 0].subtracting(["world": 1]), ["hello": 0])
        XCTAssertEqual(["hello": 0].subtracting(["hello": 0, "world": 1]), [:])
        XCTAssertEqual(["hello": 0].subtracting([:]), ["hello": 0])
        XCTAssertEqual(["hello": 0, "world": 1].subtracting(["world": 1]), ["hello": 0])
         XCTAssertEqual(["hello": "world", "!": ""].subtracting(["hello": "world"], ["!": ""]), [:])
    }
    
    func testSubtract() {
        var helloWorld = ["hello": 0, "world": 1]
        helloWorld.subtract(["world": 1])
        XCTAssertEqual(helloWorld, ["hello": 0])
        helloWorld.subtract(["world": 1])
        XCTAssertEqual(helloWorld, ["hello": 0])
        helloWorld.subtract([:])
        XCTAssertEqual(helloWorld, ["hello": 0])
        helloWorld.subtract(["hello": 0], [:])
        XCTAssertEqual(helloWorld, [:])
        helloWorld.subtract([:])
        XCTAssertEqual(helloWorld, [:])
    }
    
    func testIsSubdictionaryOf() {
        XCTAssertTrue(["hello": 0].isSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertTrue(["hello": 0, "world": 1].isSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["": 0].isSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse([:].isSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0, "world": 1, "!": 2].isSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0].isSubdictionary(of: [:]))
    }
    
    func testIsStrictSubdictionaryOf() {
        XCTAssertTrue(["hello": 0].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0, "world": 1].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["": 0].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse([:].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0, "world": 1, "!": 2].isStrictSubdictionary(of: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0].isStrictSubdictionary(of: [:]))
    }
    
    func testContains() {
        XCTAssertTrue(["hello": 0, "world": 1].contains(other: ["hello": 0]))
        XCTAssertTrue(["hello": 0, "world": 1].contains(other: ["hello": 0, "world": 1]))
        XCTAssertFalse(["hello": 0, "world": 1].contains(other: ["": 0]))
        XCTAssertFalse(["hello": 0, "world": 1].contains(other: [:]))
        XCTAssertFalse(["hello": 0, "world": 1].contains(other: ["hello": 0, "world": 1, "!": 2]))
        XCTAssertFalse([:].contains(other: ["hello": 0]))
    }
    
}
