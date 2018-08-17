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
        let key = "HelloWorld!"
        XCTAssertNil(UserDefaults.standard[key])
        UserDefaults.standard.set(true, forKey: key)
        XCTAssertTrue(UserDefaults.standard[key]! as! Bool)
        UserDefaults.standard.set(false, forKey: key)
        XCTAssertFalse(UserDefaults.standard[key]! as! Bool)
        UserDefaults.standard.removeObject(forKey: key)
        XCTAssertNil(UserDefaults.standard[key])
    }
    
}
