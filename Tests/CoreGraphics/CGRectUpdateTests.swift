//
//  CGRectUpdateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/10.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CGRectUpdateTests: XCTestCase {
    
    func testUpdatingX() {
        let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        let newRect = rect.updating(x: 2.0)
        XCTAssertEqual(newRect, CGRect(x: 2.0, y: 1.0, width: 1.0, height: 1.0))
    }
    
    func testUpdateX() {
        var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        rect.update(x: 2.0)
        XCTAssertEqual(rect, CGRect(x: 2.0, y: 1.0, width: 1.0, height: 1.0))
    }
    
    func testUpdatingY() {
        let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        let newRect = rect.updating(y: 2.0)
        XCTAssertEqual(newRect, CGRect(x: 1.0, y: 2.0, width: 1.0, height: 1.0))
    }
    
    func testUpdateY() {
        var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        rect.update(y: 2.0)
        XCTAssertEqual(rect, CGRect(x: 1.0, y: 2.0, width: 1.0, height: 1.0))
    }
    
    func testUpdatingWidth() {
        let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        let newRect = rect.updating(width: 2.0)
        XCTAssertEqual(newRect, CGRect(x: 1.0, y: 1.0, width: 2.0, height: 1.0))
    }
    
    func testUpdateWidth() {
        var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        rect.update(width: 2.0)
        XCTAssertEqual(rect, CGRect(x: 1.0, y: 1.0, width: 2.0, height: 1.0))
    }
    
    func testUpdatingHeight() {
        let rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        let newRect = rect.updating(height: 2.0)
        XCTAssertEqual(newRect, CGRect(x: 1.0, y: 1.0, width: 1.0, height: 2.0))
    }
    
    func testUpdateHeight() {
        var rect = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        rect.update(height: 2.0)
        XCTAssertEqual(rect, CGRect(x: 1.0, y: 1.0, width: 1.0, height: 2.0))
    }
    
}
