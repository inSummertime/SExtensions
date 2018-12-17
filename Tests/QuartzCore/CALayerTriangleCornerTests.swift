//
//  CALayerTriangleCornerTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/12/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CALayerTriangleCornerTests: XCTestCase {

    func testAddTriangleCorner() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        let topLeftTriangleCorner = view.layer.addTriangleCorner(corner: .bottomRight, size: CGSize(width: 16, height: 16), color: .white)
        XCTAssertEqual(view.layer.sublayers?.first!, topLeftTriangleCorner)
    }

}
