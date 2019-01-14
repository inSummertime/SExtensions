//
//  NSObjectClassNameTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/29.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class NSObjectClassNameTests: XCTestCase {

    func testClassName() {
        XCTAssertEqual(className, "NSObjectClassNameTests")
        XCTAssertEqual(NSObjectClassNameTests.className, "NSObjectClassNameTests")
    }
}
