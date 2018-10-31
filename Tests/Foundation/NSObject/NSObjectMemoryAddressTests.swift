//
//  NSObjectMemoryAddressTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/10/30.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class NSObjectMemoryAddressTests: XCTestCase {

    func testMemoryAddress() {
        let userDefaults = UserDefaults()
        let memoryAddress = userDefaults.memoryAddress
        let unsafeMutableRawPointerDescription = Unmanaged.passUnretained(userDefaults).toOpaque().debugDescription
        XCTAssertEqual(UInt(memoryAddress), UInt(unsafeMutableRawPointerDescription))
    }

}
