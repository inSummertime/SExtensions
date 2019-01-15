//
//  IntCurrencyTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/5.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class IntCurrencyTests: XCTestCase {

    func testLocalCurrency() {
        if Locale.current.identifier == "en_US" {
            XCTAssertEqual(100.localCurrency, "$100")
        }
    }

    func testUSDollar() {
        XCTAssertTrue(100.USDollar == "$100" || 100.USDollar == "US$100")
        XCTAssertTrue(0.USDollar == "$0" || 0.USDollar == "US$0")
    }

    func testCurrency() {
        let dollar = (-100).currency(currencyCode: "USD")
        XCTAssertTrue(dollar == "-$100" || dollar == "-US$100")
    }
}
