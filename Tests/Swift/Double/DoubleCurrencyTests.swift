//
//  DoubleCurrencyTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/7/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class DoubleCurrencyTests: XCTestCase {

    func testLocalCurrency() {
        if Locale.current.identifier == "en_US" {
            XCTAssertEqual(100.0.localCurrency, "$100.00")
        }
    }

    func testUSDollar() {
        XCTAssertTrue(100.0.USDollar == "$100.00" || 100.0.USDollar == "US$100.00")
        XCTAssertTrue(00.0000000.USDollar == "$0.00" || 00.0000000.USDollar == "US$0.00")
    }

    func testCurrency() {
        let dollar = (-100.0091111).currency(currencyCode: "USD")
        XCTAssertTrue(dollar == "-$100.01" || dollar == "-US$100.01")
    }

}
