//
//  CALayerCornerTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/12/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import XCTest

final class CALayerCornerTests: XCTestCase {

    func testBeRound() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8.0, height: 8.0))
        view.layer.beRound()
        XCTAssertEqual(view.layer.cornerRadius, 4.0)
    }

}
