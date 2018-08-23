//
//  StringAlphanumericTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/5.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class StringAlphanumericTests: XCTestCase {
    
    func testIsAlphanumeric() {
        XCTAssertFalse("".isAlphanumeric)
        XCTAssertFalse(" ".isAlphanumeric)
        XCTAssertFalse("!".isAlphanumeric)
        XCTAssertFalse("h".isAlphanumeric)
        XCTAssertFalse("0".isAlphanumeric)
        XCTAssertFalse("1.0".isAlphanumeric)
        XCTAssertFalse("Hello world!".isAlphanumeric)
        XCTAssertFalse("Hello world * 2".isAlphanumeric)
        XCTAssertTrue("Helloworld2".isAlphanumeric)
    }
    
    func testHasLettersAndNumbers() {
        XCTAssertFalse("".hasLettersAndNumbers)
        XCTAssertFalse(" ".hasLettersAndNumbers)
        XCTAssertFalse("!".hasLettersAndNumbers)
        XCTAssertFalse("h".hasLettersAndNumbers)
        XCTAssertFalse("0".hasLettersAndNumbers)
        XCTAssertFalse("1.0".hasLettersAndNumbers)
        XCTAssertFalse("Hello world!".hasLettersAndNumbers)
        XCTAssertTrue("Hello world! * 2".hasLettersAndNumbers)
    }
    
    func testHasLetters() {
        XCTAssertFalse("".hasLetters)
        XCTAssertFalse(" ".hasLetters)
        XCTAssertFalse("!".hasLetters)
        XCTAssertTrue("h".hasLetters)
        XCTAssertFalse("0".hasLetters)
        XCTAssertTrue("Hello world!".hasLetters)
        XCTAssertTrue("Hello world! * 2".hasLetters)
    }
    
    func testHasLettersOnly() {
        XCTAssertFalse("".hasLettersOnly)
        XCTAssertFalse(" ".hasLettersOnly)
        XCTAssertFalse("!".hasLettersOnly)
        XCTAssertTrue("h".hasLettersOnly)
        XCTAssertFalse("0".hasLettersOnly)
        XCTAssertFalse("Hello world!".hasLettersOnly)
        XCTAssertFalse("Hello world! * 2".hasLettersOnly)
        XCTAssertTrue("Helloworld".hasLettersOnly)
    }
    
    func testHasNumbers() {
        XCTAssertFalse("".hasNumbers)
        XCTAssertFalse(" ".hasNumbers)
        XCTAssertFalse("!".hasNumbers)
        XCTAssertFalse("h".hasNumbers)
        XCTAssertTrue("0".hasNumbers)
        XCTAssertTrue("1.0".hasNumbers)
        XCTAssertFalse("Hello world!".hasNumbers)
        XCTAssertTrue("Hello world! * 2".hasNumbers)
    }
    
    func testHasNumbersOnly() {
        XCTAssertFalse("".hasNumbersOnly)
        XCTAssertFalse(" ".hasNumbersOnly)
        XCTAssertFalse("!".hasNumbersOnly)
        XCTAssertFalse("h".hasNumbersOnly)
        XCTAssertTrue("0".hasNumbersOnly)
        XCTAssertFalse("1.0".hasNumbersOnly)
        XCTAssertFalse("1,0".hasNumbersOnly)
        XCTAssertFalse("Hello world!".hasNumbersOnly)
        XCTAssertFalse("Hello world! * 2".hasNumbersOnly)
    }
    
}
