//
//  CGColorIsEqualTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/24.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGColorIsEqualTests: XCTestCase {

    func testIsEqualWithConversion() {
        let clearColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        XCTAssertTrue(clearColor.isEqualWithConversion(to: UIColor.clear.cgColor))

        let whiteColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        XCTAssertTrue(whiteColor.isEqualWithConversion(to: UIColor.white.cgColor))
        XCTAssertFalse(whiteColor.isEqualWithConversion(to: UIColor.black.cgColor))

        let blackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        XCTAssertTrue(blackColor.isEqualWithConversion(to: UIColor.black.cgColor))
        XCTAssertFalse(blackColor.isEqualWithConversion(to: UIColor.white.cgColor))
    }
}
