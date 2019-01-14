//
//  StringHeightTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/6/8.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class StringHeightTests: XCTestCase {

    func testHeight() {
        let helloWorld = "Hello world!"
        let font = UIFont.systemFont(ofSize: 16.0)
        let height = helloWorld.height(withConstrainedWidth: .greatestFiniteMagnitude, font: font)
        XCTAssertEqual(height, font.lineHeight)

        let height1 = helloWorld.height(withConstrainedWidth: 32.0, font: font)
        let height2 = helloWorld.height(withConstrainedWidth: 64.0, font: font)
        XCTAssertTrue(height1 > height2)

        let height3 = helloWorld.height(withConstrainedWidth: 0, font: font)
        let height4 = helloWorld.height(withConstrainedWidth: 0, font: font)
        XCTAssertTrue(height3 == height4)
    }
}
