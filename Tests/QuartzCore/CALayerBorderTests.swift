//
//  CALayerBorderTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/11/1.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CALayerBorderTests: XCTestCase {

    func testAddAndClearBorders() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
        view.layer.addBorders(color: .white, width: 1.0)
        XCTAssertEqual(view.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 1.0)
        view.layer.clearBorders()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

    func testAddTopBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
        view.layer.addTopBorder(color: .clear, borderWidth: 1.0)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 7.0)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 1.0)
    }

    func testAddRightBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
        view.layer.addRightBorder(color: .clear, borderWidth: 1.0)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 1.0)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 7.0)
    }

    func testAddBottomBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
        view.layer.addBottomBorder(color: .clear, borderWidth: 1.0)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 7.0)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 1.0)
    }

    func testAddLeftBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 7.0, height: 7.0))
        view.layer.addLeftBorder(color: .clear, borderWidth: 1.0)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 1.0)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 7.0)
    }

}
