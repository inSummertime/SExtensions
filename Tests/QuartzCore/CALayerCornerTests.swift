//
//  CALayerCornerTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/12/14.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerCornerTests: XCTestCase {

    func testBeRounded() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8.0, height: 8.0))
        view.layer.beRounded()
        XCTAssertEqual(view.layer.cornerRadius, 4.0)
    }
}
