//
//  CharacterCaseTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/18.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CharacterCaseTests: XCTestCase {

    func testIsUppercase() {
        XCTAssertTrue(Character("A").isUppercase)
        XCTAssertFalse(Character("b").isUppercase)
        XCTAssertTrue(Character(" ").isUppercase)
        XCTAssertTrue(Character("!").isUppercase)
    }

    func testIsLowercase() {
        XCTAssertFalse(Character("A").isLowercase)
        XCTAssertTrue(Character("b").isLowercase)
        XCTAssertTrue(Character(" ").isLowercase)
        XCTAssertTrue(Character("!").isLowercase)
    }
}
