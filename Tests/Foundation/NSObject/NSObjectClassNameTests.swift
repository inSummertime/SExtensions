//
//  NSObjectClassNameTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/29.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class NSObjectClassNameTests: XCTestCase {

    func testClassName() {
        XCTAssertEqual(className, "NSObjectClassNameTests")
        XCTAssertEqual(NSObjectClassNameTests.className, "NSObjectClassNameTests")
    }

}
