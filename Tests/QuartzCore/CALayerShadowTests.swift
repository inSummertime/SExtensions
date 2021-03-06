//
//  CALayerShadowTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/12/18.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerShadowTests: XCTestCase {

    func testAddShadow() {
        let layer = CALayer()
        layer.addShadow(color: .black)
        XCTAssertEqual(layer.shadowColor, UIColor.black.cgColor)
    }
}
