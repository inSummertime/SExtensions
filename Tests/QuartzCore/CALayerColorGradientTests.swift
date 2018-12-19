//
//  CALayerColorGradientTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/11/3.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CALayerAddColorGradientTests: XCTestCase {

    func testAddColorGradientHorizontally() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        view.layer.addColorGradient(startColor: .white, endColor: .black)
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
        view.layer.addColorGradient(startColor: .white, endColor: .black, isHorizontal: false)
        let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssertEqual(gradientLayer!.startPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.startPoint.y, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.x, 0.0)
        XCTAssertEqual(gradientLayer!.endPoint.y, 1.0)
    }

}
