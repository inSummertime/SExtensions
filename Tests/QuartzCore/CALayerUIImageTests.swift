//
//  CALayerUIImageTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/2.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerUIImageTests: XCTestCase {

    func testImage() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        let subview = UIView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        subview.backgroundColor = .lightGray
        view.addSubview(subview)
        let image = view.layer.image
        XCTAssertEqual(image!.size, CGSize(width: 64, height: 64))
    }
}
