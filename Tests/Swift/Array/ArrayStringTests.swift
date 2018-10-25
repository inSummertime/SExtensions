//
//  ArrayStringTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class ArrayStringTests: XCTestCase {

    func testLongestCommonPrefix() {
        XCTAssertEqual(["abc", "abcd", "abcde"].longestCommonPrefix, "abc")
        XCTAssertEqual(["abc"].longestCommonPrefix, "abc")
        XCTAssertEqual([""].longestCommonPrefix, "")
        XCTAssertNil([String]().longestCommonPrefix)
    }
    
    func testLongestCommonSuffix() {
        XCTAssertEqual(["xyz", "wxyz", "vwxyz"].longestCommonSuffix, "xyz")
        XCTAssertEqual(["xyz"].longestCommonSuffix, "xyz")
        XCTAssertEqual([""].longestCommonSuffix, "")
        XCTAssertNil([String]().longestCommonSuffix)
    }
    
    func testGroupAnagrams() {
        XCTAssertEqual(["ab", "ba", "abc", "acb", "bac"].groupAnagrams, [["ab", "ba"], ["abc", "acb", "bac"]])
        XCTAssertEqual(["ab", "ba", "abc", "acb", "bac", " ", ""].groupAnagrams, [[""], [" "], ["ab", "ba"], ["abc", "acb", "bac"]])
    }

}
