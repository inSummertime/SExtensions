//
//  ArrayIndexedDictionaryTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/1.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class ArrayIndexedDictionaryTests: XCTestCase {

    func testIndexedDictionary() {
        let dictionary: [Int: Any] = ["hello", "world", "!", 0].indexedDictionary
        XCTAssertEqual(dictionary[0] as! String, "hello")
        XCTAssertEqual(dictionary[3] as! Int, 0)
        XCTAssertEqual([Double]().indexedDictionary, [:])
    }
}
