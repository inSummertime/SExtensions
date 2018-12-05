//
//  DoublePercentageTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/8.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DoublePercentageTests: XCTestCase {

    func testPercentage() {
        XCTAssertEqual(2.0.percentage()!, "200%")
        XCTAssertEqual(1.0.percentage()!, "100%")
        XCTAssertEqual(0.99999.percentage(maximumFractionDigits: 1)!, "100%")
        XCTAssertEqual(0.55555.percentage(maximumFractionDigits: 1)!, "55.6%")
        XCTAssertEqual(0.22222.percentage(maximumFractionDigits: 2)!, "22.22%")
        XCTAssertEqual(0.0.percentage(maximumFractionDigits: 2)!, "0%")
        XCTAssertEqual((-0.22222).percentage(maximumFractionDigits: 3)!, "-22.222%")
        XCTAssertEqual((-0.55555).percentage(maximumFractionDigits: 3)!, "-55.555%")
        XCTAssertEqual((-0.99999).percentage(maximumFractionDigits: 4)!, "-99.999%")
        XCTAssertEqual((-1.0).percentage(maximumFractionDigits: 4)!, "-100%")
    }

}
