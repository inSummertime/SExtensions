//
//  CGImageCroppingAtTheCenterTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/2/4.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageCroppingAtTheCenterTests: XCTestCase {

    func testCroppingAtTheCenter() {
        guard let cgImage = CGImage.createWithGradient(colors: [.white, .black], isHorizontal: true, size: CGSize(width: 64, height: 32)) else {
            XCTFail("Failed to create the image.")
            return
        }

        guard let cropped = cgImage.croppingAtTheCenter(to: CGSize(width: 128, height: 64)) else {
            XCTFail("Failed to crop the image.")
            return
        }
        XCTAssertEqual(cropped.width, 64)
        XCTAssertEqual(cropped.height, 32)

        guard let anotherCropped = cgImage.croppingAtTheCenter(to: CGSize(width: 128, height: 16)) else {
            XCTFail("Failed to crop the image.")
            return
        }
        XCTAssertEqual(anotherCropped.width, 64)
        XCTAssertEqual(anotherCropped.height, 16)
    }

    func testCroppingAtTheCenterLoad() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "icon", ofType: "png") else { return }
        let image = UIImage(contentsOfFile: path)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }

        guard let cropped = cgImage.croppingAtTheCenter(to: CGSize(width: 33, height: 39)) else {
            XCTFail("Failed to crop the image.")
            return
        }
        // cropping(to:) calls the integral function to adjust the rect parameter to integral bounds.
        XCTAssertEqual(cropped.width, 34)
        XCTAssertEqual(cropped.height, 40)

        XCTAssertNil(cgImage.croppingAtTheCenter(to: CGSize(width: 0, height: 0)))
    }
}
