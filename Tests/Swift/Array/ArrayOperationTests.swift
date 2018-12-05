//
//  ArrayOperationTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/27.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayOperationTests: XCTestCase {

    func testUnion() {
        XCTAssertEqual(["hello", "world"].union(["!"], ["hello"]), ["hello", "world", "!"])
        let empty: [String] = []
        XCTAssertEqual(empty.union([], []), [])
    }

    func testIntersection() {
        XCTAssertEqual(["hello", "world"].intersection(["hello"]), ["hello"])
        XCTAssertEqual(["hello", "world"].intersection(["hello"], ["world"]), [])
        XCTAssertEqual(["hello", "world"].intersection(["hello"], ["!"]), [])
        let empty: [String] = []
        XCTAssertEqual(empty.intersection([], []), [])
    }

    func testDifference() {
        XCTAssertEqual(["hello", "world"].difference(["hello"]), ["world"])
        XCTAssertEqual(["hello", "world"].difference(["hello"], ["world"]), [])
        XCTAssertEqual(["hello", "world"].difference(["hello"], ["!"]), ["world", "!"])
        XCTAssertEqual(["hello"].difference(["world"], ["!"]), ["hello", "world", "!"])
        let empty: [String] = []
        XCTAssertEqual(empty.difference([], []), [])
    }

    func testSubtracting() {
        XCTAssertEqual(["hello", "world", "!"].subtracting(["hello"]), ["world", "!"])
        XCTAssertEqual(["hello", "world", "!"].subtracting(["hello", "world"]), ["!"])
        XCTAssertEqual(["hello", "world", "!"].subtracting(["hello", "world"], ["!"]), [])
    }

    func testIsSubarray() {
        XCTAssertTrue(["hello"].isSubarray(of: ["hello", "world"]))
        XCTAssertFalse(["hello"].isSubarray(of: ["world"]))
        XCTAssertFalse(["hello"].isSubarray(of: []))
        XCTAssertTrue(["hello"].isSubarray(of: ["hello"]))
    }

    func testIsStrictSubarray() {
        XCTAssertFalse(["hello"].isStrictSubarray(of: ["hello"]))
    }

    func testContains() {
        XCTAssertTrue(["hello", "world"].contains(["hello"]))
        XCTAssertFalse(["hello"].contains(["world"]))
        XCTAssertTrue(["hello"].contains([]))
        XCTAssertTrue(["hello"].contains(["hello"]))
        XCTAssertFalse([String]().contains(["world"]))
        XCTAssertTrue([String]().contains([]))
    }

    func testElementsToAdd() {
        struct Data: Equatable {
            let id: Int
            let title: String
        }
        let array = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
        let anotherArray = [Data(id: 1, title: "hello"), Data(id: 2, title: "!")]
        let result = array.elementsToAdd(other: anotherArray) {
            $0.id == $1.id
        }
        XCTAssertEqual(result, [Data(id: 2, title: "!")])
        let anotherResult = array.elementsToAdd(other: anotherArray) {
            $0.title == $1.title
        }
        XCTAssertEqual(anotherResult, [Data(id: 2, title: "!")])
    }

    func testElementsToRemove() {
        struct Data: Equatable {
            let id: Int
            let title: String
        }
        let array = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
        let anotherArray = [Data(id: 1, title: "hello"), Data(id: 2, title: "!")]
        let result = array.elementsToRemove(other: anotherArray) {
            $0.id == $1.id
        }
        XCTAssertEqual(result, [Data(id: 0, title: "hello")])
        let anotherResult = array.elementsToRemove(other: anotherArray) {
            $0.title == $1.title
        }
        XCTAssertEqual(anotherResult, [Data(id: 1, title: "world")])
    }

    func testElementsToUpdate() {
        struct Data: Equatable {
            let id: Int
            let title: String
        }
        let array = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
        let anotherArray = [Data(id: 1, title: "hello"), Data(id: 2, title: "!")]
        let result = array.elementsToUpdate(other: anotherArray) {
            $0.id == $1.id
        }
        XCTAssertEqual(result, [Data(id: 1, title: "hello")])
        let anotherResult = array.elementsToUpdate(other: anotherArray) {
            $0.title == $1.title
        }
        XCTAssertEqual(anotherResult, [Data(id: 1, title: "hello")])
    }

}
