//
//  CGImageThumbnailTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/19.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageThumbnailTests: XCTestCase {

    func testSourceCreate() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "icon", withExtension: "png") else { return }
        guard let cgImage = CGImage.createThumbnailWithURL(url, size: CGSize(width: 22, height: 26)) else {
            XCTFail("Failed to create the CGImage")
            return
        }
        XCTAssertEqual(cgImage.width, 22)
        XCTAssertEqual(cgImage.height, 26)
    }
}
