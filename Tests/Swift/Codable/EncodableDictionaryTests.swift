//
//  EncodableDictionaryTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/6.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class EncodableDictionaryTests: XCTestCase {

    struct TestData: Encodable {
        let intType: Int
        let doubleType: Double
        let boolType: Bool
        let stringType: String
        let dictionaryType: [String: String]
        let arrayType: [Int]
        let defaultValue = 0
        enum CodingKeys: String, CodingKey {
            case intType = "int_type"
            case doubleType = "double_type"
            case stringType = "string_type"
            case boolType = "bool_type"
            case dictionaryType = "dictionary_type"
            case arrayType = "array_type"
        }
    }

    func testDictionary() {
        let data = TestData(intType: 0, doubleType: 1.0, boolType: true, stringType: "text", dictionaryType: ["text": "textData"], arrayType: [0, 1])
        let sourceDictionary = data.dictionary
        let targetDictionary: [String: Any] = ["int_type": 0, "double_type": 1.0, "bool_type": true, "string_type": "text", "dictionary_type": ["text": "textData"], "array_type": [0, 1]]
        XCTAssertTrue(NSDictionary(dictionary: sourceDictionary!).isEqual(to: targetDictionary))
    }

}
