//
//  SetRemoveTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/10.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class SetRemoveTests: XCTestCase {

    func testRemovingEmpty() {
        let emptyStringSet: Set = [""]
        XCTAssertTrue(emptyStringSet.removingEmpty().isEmpty)
        let emptyArraySet: Set<[String]> = [[]]
        XCTAssertTrue(emptyArraySet.removingEmpty().isEmpty)
        let emptyArrayStringSet: Set = [[""], ["", ""]]
        XCTAssertTrue(emptyArrayStringSet.removingEmpty().isEmpty)
        let emptyDictionarySet: Set<[String: String]> = [[:]]
        XCTAssertTrue(emptyDictionarySet.removingEmpty().isEmpty)
        let emptyDictionaryValueSet: Set<[String: String]> = [["hello": ""]]
        XCTAssertTrue(emptyDictionaryValueSet.removingEmpty().isEmpty)
        let emptyDictionaryDictionaryValueSet: Set<[String: [String: [String: String]]]> = [["hello": ["world": [:]]]]
        XCTAssertTrue(emptyDictionaryDictionaryValueSet.removingEmpty().isEmpty)
        let nullSet: Set = [NSNull()]
        XCTAssertTrue(nullSet.removingEmpty().isEmpty)
        let nullArraySet: Set = [[NSNull()]]
        XCTAssertTrue(nullArraySet.removingEmpty().isEmpty)
        let nullDictionarySet: Set = [["world": NSNull()]]
        XCTAssertTrue(nullDictionarySet.removingEmpty().isEmpty)
        let whitespaceSet: Set = ["hello", " "]
        XCTAssertFalse(whitespaceSet.removingEmpty().isEmpty)
        let arraySet: Set = [["world"]]
        XCTAssertFalse(arraySet.removingEmpty().isEmpty)
        let stringSet: Set = ["hello", "world"]
        XCTAssertEqual(stringSet.removingEmpty(), ["hello", "world"])
    }
    
    func testRemovingElements() {
        let set: Set = ["hello", "world", "!"]
        XCTAssertEqual(set.removing("hello", "world"), ["!"])
        XCTAssertEqual(set.removing("", " "), ["hello", "world", "!"])
    }
    
    func testRemovingNil() {
        let set: Set = [0, nil, 1]
        XCTAssertEqual(set.removingNils(), [0, 1])
        let anotherSet: Set = ["hello", nil, "world", nil]
        XCTAssertEqual(anotherSet.removingNils(), ["hello",  "world"])
        let nilSet: Set<Double?> = [nil, nil]
        XCTAssertEqual(nilSet.removingNils(), [])
    }

}
