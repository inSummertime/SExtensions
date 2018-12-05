//
//  CGRectCenterTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/11.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CGRectCenterTests: XCTestCase {

    func testCenter() {
        let rect = CGRect(x: 0, y: 0, width: 2.0, height: 4.0)
        XCTAssertEqual(rect.center, CGPoint(x: 1.0, y: 2.0))
    }

}
