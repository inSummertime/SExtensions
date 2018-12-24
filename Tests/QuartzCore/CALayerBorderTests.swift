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
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0)
        XCTAssertEqual(view.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 1.0)
        view.layer.clearBorders()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

    func testAddTopBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .top)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 64)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 1.0)
    }

    func testAddRightBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .right)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 1.0)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 64)
    }

    func testAddBottomBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .bottom)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 64)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 1.0)
    }

    func testAddLeftBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .left)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer!.frame.size.width, 1.0)
        XCTAssertEqual(topBorderLayer!.frame.size.height, 64)
    }

    func testAddColorGradientBordersHorizontally() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .all, isHorizontal: true)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.bounds, view.bounds)
        XCTAssertEqual(gradientLayer!.colors?.first as! CGColor, UIColor.white.cgColor)
        XCTAssertEqual(gradientLayer!.colors?.last as! CGColor, UIColor.black.cgColor)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 0)
    }

    func testAddColorGradientBordersVertically() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .all, isHorizontal: false)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 1.0)
    }

    func testColorGradientTopBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .top)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 0)
    }

    func testColorGradientRightBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .right)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 1.0)
    }

    func testColorGradientBottomBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .bottom)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 0)
    }

    func testColorGradientLeftBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .left)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 1.0)
    }

    func testAddColorGradientRoundBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.backgroundColor = .white
        view.layer.addColorGradientRoundBorder(colors: [.white, .red, .blue], width: 4, isHorizontal: true, corners: [.allCorners], radius: 12)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 1)
        XCTAssertEqual(gradientLayer!.endPoint.y, 0)
    }

    func testAnimateBorders() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 7)
        view.layer.animateBorders(duration: 7, color: .black, width: 16)
        XCTAssertEqual(view.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 7)
    }

}
