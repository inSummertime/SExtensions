//
//  CALayerRemoveAllSublayersTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2018/11/2.
//  Copyright © 2018 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerRemoveAllSublayersTests: XCTestCase {

    func test() {
        let parentlayer = CALayer()
        XCTAssertNil(parentlayer.sublayers)
        let sublayer = CALayer()
        parentlayer.addSublayer(sublayer)
        let anotherSublayer = CALayer()
        parentlayer.addSublayer(anotherSublayer)
        XCTAssertTrue(parentlayer.sublayers!.count > 0)
        parentlayer.removeAllSublayers()
        XCTAssertNil(parentlayer.sublayers)
    }
}
