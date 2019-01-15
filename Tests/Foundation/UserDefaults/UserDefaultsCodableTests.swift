//
//  UserDefaultsCodableTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/8/18.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class UserDefaultsCodableTests: XCTestCase {

    func testCodable() {
        struct Object: Codable {
            let id: Int
        }
        let object = Object(id: 0)
        let key = "HelloWorld!"
        let userDefaults = UserDefaults(suiteName: "HelloWorld!")
        userDefaults?.setCodable(object, forKey: key)
        XCTAssertEqual(userDefaults?.codable(Object.self, forKey: key)!.id, 0)
        userDefaults?.removeObject(forKey: key)
    }
}
