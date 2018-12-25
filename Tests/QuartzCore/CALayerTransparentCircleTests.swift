//
//  CALayerTransparentCircleTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/12/24.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CALayerTransparentCircleTests: XCTestCase {

    func testAddTransparentCircle() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.addTransparentCircle(center: view.layer.bounds.center, radius: 16, overlayColor: .red, overlayAlpha: 0.9)
        let shapeLayer = view.layer.sublayers?.first
        XCTAssertNotNil(shapeLayer)
        XCTAssertEqual(shapeLayer!.frame, view.layer.frame)
    }

}
