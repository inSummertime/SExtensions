//
//  CGPointOperatorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CGPointOperatorTests: XCTestCase {
    
    func testAdditionOperator() {
        let point = CGPoint(x: 1.0, y: 2.0)
        let anotherPoint = CGPoint(x: 3.0, y: 4.0)
        let result = point + anotherPoint
        XCTAssertEqual(result.x, 4.0)
        XCTAssertEqual(result.y, 6.0)
    }
    
    func testAdditionAssignmentOperator() {
        var point = CGPoint(x: 1.0, y: 2.0)
        point += CGPoint(x: 3.0, y: 4.0)
        XCTAssertEqual(point.x, 4.0)
        XCTAssertEqual(point.y, 6.0)
    }
    
    func testSubtractionOperator() {
        let point = CGPoint(x: 1.0, y: 2.0)
        let anotherPoint = CGPoint(x: 3.0, y: 4.0)
        let result = point - anotherPoint
        XCTAssertEqual(result.x, -2.0)
        XCTAssertEqual(result.y, -2.0)
    }
    
    func testSubtractionAssignmentOperator() {
        var point = CGPoint(x: 1.0, y: 2.0)
        point -= CGPoint(x: 3.0, y: 4.0)
        XCTAssertEqual(point.x, -2.0)
        XCTAssertEqual(point.y, -2.0)
    }
    
}
