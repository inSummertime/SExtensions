//
//  UserDefaultsDateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class UserDefaultsDateTests: XCTestCase {
    
    func testDate() {
        let key = "HelloWorld"
        let userDefaults = UserDefaults(suiteName: "HelloWorld")
        XCTAssertNil(userDefaults?.date(forKey: key))
        userDefaults?.set(Date(timeIntervalSinceReferenceDate: 0), forKey: key)
        XCTAssertEqual(userDefaults?.date(forKey: key)!, Date(timeIntervalSinceReferenceDate: 0))
    }
    
}
