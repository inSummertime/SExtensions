//
//  UserDefaultsCodableTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class UserDefaultsCodableTests: XCTestCase {
    
    func testCodable() {
        struct Object: Codable {
            let id: Int
        }
        let object = Object(id: 0)
        let key = "HelloWorld!"
        UserDefaults.standard.setCodable(object, forKey: key)
        XCTAssertEqual(UserDefaults.standard.codable(Object.self, forKey: key)!.id, 0)
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
