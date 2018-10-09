//
//  SetOperationTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/7.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class SetOperationTests: XCTestCase {

    func testDifference() {
        let set: Set = ["hello", "world"]
        XCTAssertEqual(set.difference(["hello"]), ["world"])
        XCTAssertEqual(set.difference(["hello"], ["world"]), [])
        XCTAssertEqual(set.difference(["hello"], ["!"]), ["world", "!"])
        XCTAssertEqual(set.difference(["hello"], ["!"]), ["!", "world"])
        let anotherSet: Set = ["hello"]
        XCTAssertEqual(anotherSet.difference(["world"], ["!"]), ["hello", "world", "!"])
        let empty: Set<String> = []
        XCTAssertEqual(empty.difference([], []), [])
    }

    func testContains() {
        let set: Set = ["hello", "world"]
        XCTAssertTrue(set.contains(["hello"]))
        let anotherSet: Set = ["hello"]
        XCTAssertFalse(anotherSet.contains(["world"]))
        XCTAssertTrue(anotherSet.contains([]))
        XCTAssertTrue(anotherSet.contains(["hello"]))
        let empty: Set<String> = []
        XCTAssertFalse(empty.contains(["world"]))
        XCTAssertTrue(empty.contains([]))
    }
    
    func testElementsToAdd() {
        struct Data: Hashable {
            let id: Int
            let title: String
        }
        let set: Set = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
        let anotherSet: Set = [Data(id: 1, title: "hello"), Data(id: 2, title: "!")]
        let result = set.elementsToAdd(other: anotherSet) {
            $0.id == $1.id
        }
        XCTAssertEqual(result, [Data(id: 2, title: "!")])
        let anotherResult = set.elementsToAdd(other: anotherSet) {
            $0.title == $1.title
        }
        XCTAssertEqual(anotherResult, [Data(id: 2, title: "!")])
    }
    
    func testElementsToRemove() {
        struct Data: Hashable {
            let id: Int
            let title: String
        }
        let set: Set = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
        let anotherSet: Set = [Data(id: 1, title: "hello"), Data(id: 2, title: "!")]
        let result = set.elementsToRemove(other: anotherSet) {
            $0.id == $1.id
        }
        XCTAssertEqual(result, [Data(id: 0, title: "hello")])
        let anotherResult = set.elementsToRemove(other: anotherSet) {
            $0.title == $1.title
        }
        XCTAssertEqual(anotherResult, [Data(id: 1, title: "world")])
    }
    
    func testElementsToUpdate() {
        struct Data: Hashable {
            let id: Int
            let title: String
        }
        let set: Set = [Data(id: 0, title: "hello"), Data(id: 1, title: "world")]
        let anotherSet: Set = [Data(id: 1, title: "hello"), Data(id: 2, title: "!")]
        let result = set.elementsToUpdate(other: anotherSet) {
            $0.id == $1.id
        }
        XCTAssertEqual(result, [Data(id: 1, title: "hello")])
        let anotherResult = set.elementsToUpdate(other: anotherSet) {
            $0.title == $1.title
        }
        XCTAssertEqual(anotherResult, [Data(id: 1, title: "hello")])
    }

}
