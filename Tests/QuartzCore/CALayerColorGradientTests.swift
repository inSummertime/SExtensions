//
//  CALayerColorGradientTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/11/3.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerAddColorGradientTests: XCTestCase {

    func testAddColorGradientHorizontally() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        view.layer.addColorGradient(colors: [.white, .black])
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.bounds, view.bounds)
        XCTAssertEqual(gradientLayer!.colors?.first as! CGColor, UIColor.white.cgColor)
        XCTAssertEqual(gradientLayer!.colors?.last as! CGColor, UIColor.black.cgColor)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 1.0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 0.0)
    }

    func testAddColorGradientVertically() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        view.layer.addColorGradient(colors: [.white, .black], isHorizontal: false)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 1.0)
    }

    func testAddRadialColorGradient() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addRadialColorGradient(colors: [.white, .red, .black], startPoint: CGPoint(x: 0.4, y: 0.4), endPoint: CGPoint(x: 0.6, y: 0.6), size: CGSize(width: 16, height: 16))
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.frame.origin, CGPoint(x: 24, y: 24))
        print(gradientLayer!.frame.origin)
    }
}
