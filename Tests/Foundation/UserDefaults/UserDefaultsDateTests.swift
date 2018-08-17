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
        let key = "HelloWorld!"
        XCTAssertNil(UserDefaults.standard.date(forKey: key))
        UserDefaults.standard.set(Date(timeIntervalSinceReferenceDate: 0), forKey: key)
        XCTAssertEqual(UserDefaults.standard.date(forKey: key)!, Date(timeIntervalSinceReferenceDate: 0))
        UserDefaults.standard.removeObject(forKey: key)
        XCTAssertNil(UserDefaults.standard.date(forKey: key))
    }
    
}
