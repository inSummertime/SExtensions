//
//  StringMemoryAddressTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/30.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class StringMemoryAddressTests: XCTestCase {

    func testMemoryAddress() {
        let userDefaults = UserDefaults()
        let pointerMemoryAddress = String(format: "%p", userDefaults)
        let memoryAddressOfUserDefaults = String.memoryAddress(of: userDefaults)
        XCTAssertEqual(UInt(pointerMemoryAddress), UInt(memoryAddressOfUserDefaults))
    }
}
