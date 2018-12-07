//
//  UserDefaultsSubscriptTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class UserDefaultsSubscriptTests: XCTestCase {

    func testSubscript() {
        let key = "Hello World!"
        let suiteName = Date().string(dateStyle: .full)
        let userDefaults = UserDefaults(suiteName: suiteName)
        XCTAssertNil(userDefaults?[key])
        userDefaults?.set(true, forKey: key)
        XCTAssertTrue(userDefaults?[key]! as! Bool)
        userDefaults?.set(false, forKey: key)
        XCTAssertFalse(userDefaults?[key]! as! Bool)
        userDefaults?.removeObject(forKey: key)
        XCTAssertNil(userDefaults?[key])
        userDefaults?[key] = true
        XCTAssertTrue(userDefaults?[key]! as! Bool)
        userDefaults?.removeObject(forKey: key)
    }

}
