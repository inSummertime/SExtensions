//
//  CGRectTransformTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/9/12.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGRectTransformTests: XCTestCase {

    func testTransformFromCenter() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let scaledRect = rect.transformFromCenter(scaleX: 0.5, scaleY: 0.25)
        XCTAssertEqual(scaledRect, CGRect(x: 0.25, y: 0.75, width: 0.5, height: 0.5))
        XCTAssertEqual(rect.transformFromCenter(scaleX: 0, scaleY: 0), rect)
    }

    func testTransformFromTopLeft() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let scaledRect = rect.transformFromTopLeft(scaleX: 2.0, scaleY: 1.0)
        XCTAssertEqual(scaledRect, CGRect(x: 0, y: 0, width: 2.0, height: 2.0))
        XCTAssertEqual(rect.transformFromCenter(scaleX: -1.0, scaleY: -1.0), rect)
    }

    func testTransformFromTopRight() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let scaledRect = rect.transformFromTopRight(scaleX: 2.0, scaleY: 1.0)
        XCTAssertEqual(scaledRect, CGRect(x: -1.0, y: 0, width: 2.0, height: 2.0))
    }

    func testTransformFromBottomLeft() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let scaledRect = rect.transformFromBottomLeft(scaleX: 2.0, scaleY: 2.0)
        XCTAssertEqual(scaledRect, CGRect(x: 0, y: -2.0, width: 2.0, height: 4.0))
    }

    func testTransformFromBottomRight() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let scaledRect = rect.transformFromBottomRight(scaleX: 2.0, scaleY: 2.0)
        XCTAssertEqual(scaledRect, CGRect(x: -1.0, y: -2.0, width: 2.0, height: 4.0))
    }

    func testTransformTranslate() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let translatedRect = rect.transformTranslate(tx: 2.0, ty: 2.0)
        XCTAssertEqual(translatedRect, CGRect(x: 2.0, y: 2.0, width: 1.0, height: 2.0))
    }

    func testTransform() {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 2.0)
        let translatedRect = rect.transformFromBottomRight(scaleX: 2.0, scaleY: 2.0).transformTranslate(tx: 2.0, ty: 2.0)
        XCTAssertEqual(translatedRect, CGRect(x: 1.0, y: 0, width: 2.0, height: 4.0))
    }
}
