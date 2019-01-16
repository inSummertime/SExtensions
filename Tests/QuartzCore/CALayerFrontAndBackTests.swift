//
//  CALayerFrontAndBackTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/12/18.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerFrontAndBackTests: XCTestCase {

    let superlayer = CALayer()
    let sublayer = CALayer()
    let anotherSublayer = CALayer()

    override func setUp() {
        superlayer.addSublayer(sublayer)
        superlayer.addSublayer(anotherSublayer)
        XCTAssertEqual(superlayer.sublayers?.count, 2)
        XCTAssertEqual(superlayer.sublayers?.first, sublayer)
        XCTAssertEqual(superlayer.sublayers?.last, anotherSublayer)
    }

    override func tearDown() {
        superlayer.removeAllSublayers()
    }

    func testBringToFront() {
        sublayer.bringToFront()
        XCTAssertEqual(superlayer.sublayers?.first, anotherSublayer)
        XCTAssertEqual(superlayer.sublayers?.last, sublayer)
    }

    func testSendToBack() {
        anotherSublayer.sendToBack()
        XCTAssertEqual(superlayer.sublayers?.first, anotherSublayer)
        XCTAssertEqual(superlayer.sublayers?.last, sublayer)
    }

    func testBringSublayerToFront() {
        superlayer.bringSublayerToFront(sublayer)
        XCTAssertEqual(superlayer.sublayers?.first, anotherSublayer)
        XCTAssertEqual(superlayer.sublayers?.last, sublayer)
    }

    func testSendSublayerToBack() {
        superlayer.sendSublayerToBack(anotherSublayer)
        XCTAssertEqual(superlayer.sublayers?.first, anotherSublayer)
        XCTAssertEqual(superlayer.sublayers?.last, sublayer)
    }
}
