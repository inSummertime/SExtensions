//
//  CALayerBorderTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/11/1.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

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
        XCTAssertEqual(topBorderLayer?.frame.size.width, 64)
        XCTAssertEqual(topBorderLayer?.frame.size.height, 1.0)
    }

    func testAddRightBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .right)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer?.frame.size.width, 1.0)
        XCTAssertEqual(topBorderLayer?.frame.size.height, 64)
    }

    func testAddBottomBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .bottom)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer?.frame.size.width, 64)
        XCTAssertEqual(topBorderLayer?.frame.size.height, 1.0)
    }

    func testAddLeftBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 1.0, side: .left)
        let sublayers = view.layer.sublayers
        XCTAssertTrue(sublayers!.count > 0)
        let topBorderLayer = sublayers!.last
        XCTAssertEqual(topBorderLayer?.frame.size.width, 1.0)
        XCTAssertEqual(topBorderLayer?.frame.size.height, 64)
    }

    func testAddColorGradientBordersHorizontally() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .all, isHorizontal: true)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.bounds, view.bounds)
        XCTAssertEqual(gradientLayer?.colors?.first as! CGColor, UIColor.white.cgColor)
        XCTAssertEqual(gradientLayer?.colors?.last as! CGColor, UIColor.black.cgColor)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer?.endPoint.y, 0)
    }

    func testAddColorGradientBordersVertically() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .all, isHorizontal: false)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 0)
        XCTAssertEqual(gradientLayer?.endPoint.y, 1.0)
    }

    func testColorGradientTopBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .top)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer?.endPoint.y, 0)
    }

    func testColorGradientRightBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .right)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 0)
        XCTAssertEqual(gradientLayer?.endPoint.y, 1.0)
    }

    func testColorGradientBottomBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .bottom)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer?.endPoint.y, 0)
    }

    func testColorGradientLeftBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addColorGradientBorder(colors: [UIColor.white, UIColor.black], lineWidth: 1, side: .left)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 0)
        XCTAssertEqual(gradientLayer?.endPoint.y, 1.0)
    }

    func testAddRoundBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        view.layer.addRoundBorder(color: .white, width: 1, radius: 4)
        let borderLayer = view.layer.sublayers?.first as? CAShapeLayer
        XCTAssertNotNil(borderLayer)
    }

    func testAddColorGradientRoundBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        view.layer.addColorGradientRoundBorder(colors: [.white, .red, .blue], width: 7, isHorizontal: true, corners: [.allCorners], radius: 0)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer?.startPoint.x, 0)
        XCTAssertEqual(gradientLayer?.startPoint.y, 0)
        XCTAssertEqual(gradientLayer?.endPoint.x, 1)
        XCTAssertEqual(gradientLayer?.endPoint.y, 0)
    }

    func testAnimateBorders() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addBorder(color: .white, width: 7)
        XCTAssertEqual(view.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 7)
    }

    func testAddExternalBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        let border = view.layer.addExternalBorder(color: .white, width: 4)
        XCTAssertEqual(border.frame, CGRect(x: -4, y: -4, width: 72, height: 72))
        let topBorder = view.layer.addExternalBorder(color: .white, width: 4, side: .top)
        XCTAssertEqual(topBorder.frame, CGRect(x: 0, y: -4, width: 64, height: 4))
        let rightBorder = view.layer.addExternalBorder(color: .white, width: 4, side: .right)
        XCTAssertEqual(rightBorder.frame, CGRect(x: 64, y: 0, width: 4, height: 64))
        let bottomBorder = view.layer.addExternalBorder(color: .white, width: 4, side: .bottom)
        XCTAssertEqual(bottomBorder.frame, CGRect(x: 0, y: 64, width: 64, height: 4))
        let leftBorder = view.layer.addExternalBorder(color: .white, width: 4, side: .left)
        XCTAssertEqual(leftBorder.frame, CGRect(x: -4, y: 0, width: 4, height: 64))
    }
}
