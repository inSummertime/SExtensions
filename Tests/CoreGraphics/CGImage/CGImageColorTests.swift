//
//  CGImageColorTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/25.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageColorTests: XCTestCase {

    func testColorRGBA() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "icon", ofType: "png") else { return }
        let image = UIImage(contentsOfFile: path)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }

        guard let colorAtPointOne = cgImage.colorAt(CGPoint(x: 1, y: 1)) else {
            XCTFail("Failed to get the color at point one.")
            return
        }
        XCTAssertTrue(colorAtPointOne.cgColor.isEqualWithConversion(to: UIColor.clear.cgColor))

        guard let colorAtPointCenter = cgImage.colorAt(CGPoint(x: cgImage.width / 2, y: cgImage.height / 2)) else {
            XCTFail("Failed to get the color at point center.")
            return
        }
        XCTAssertTrue(colorAtPointCenter.cgColor.isEqualWithConversion(to: UIColor.white.cgColor))
    }

    func testColorLindexed() {
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "iconIndexed", in: bundle, compatibleWith: nil)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }

        guard let colorAtPointOne = cgImage.colorAt(CGPoint(x: 1, y: 1)) else {
            XCTFail("Failed to get the color at point one.")
            return
        }
        XCTAssertTrue(colorAtPointOne.cgColor.isEqualWithConversion(to: UIColor.black.cgColor))

        guard let colorAtPointCenter = cgImage.colorAt(CGPoint(x: cgImage.width / 2, y: cgImage.height / 2)) else {
            XCTFail("Failed to get the color at point center.")
            return
        }
        XCTAssertTrue(colorAtPointCenter.cgColor.isEqualWithConversion(to: UIColor.white.cgColor))
    }

    func testColorCMYK() {
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "iconIndexed", in: bundle, compatibleWith: nil)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }

        guard let colorAtPointCenter = cgImage.colorAt(CGPoint(x: cgImage.width / 2, y: cgImage.height / 2)) else {
            XCTFail("Failed to get the color at point center.")
            return
        }
        XCTAssertTrue(colorAtPointCenter.cgColor.isEqualWithConversion(to: UIColor.white.cgColor))
    }

    func testColorLab() {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "iconLab", ofType: "tif") else { return }
        let image = UIImage(contentsOfFile: path)
        guard let cgImage = image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }

        guard let colorAtPointOne = cgImage.colorAt(CGPoint(x: 1, y: 1)) else {
            XCTFail("Failed to get the color at point zero.")
            return
        }
        XCTAssertTrue(colorAtPointOne.cgColor.isEqualWithConversion(to: UIColor.clear.cgColor))

        guard let colorAtPointCenter = cgImage.colorAt(CGPoint(x: cgImage.width / 2, y: cgImage.height / 2)) else {
            XCTFail("Failed to get the color at point center.")
            return
        }
        XCTAssertTrue(colorAtPointCenter.cgColor.isEqualWithConversion(to: UIColor.white.cgColor))
    }

    func testColorPosition() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 2))
        view.backgroundColor = .black
        view.layer.addBorder(color: .white, width: 0.5, side: .top)
        view.layer.addBorder(color: .white, width: 0.5, side: .right)
        view.layer.addBorder(color: .white, width: 0.5, side: .bottom)
        view.layer.addBorder(color: .white, width: 0.5, side: .left)
        guard let cgImage = view.layer.image?.cgImage else {
            XCTFail("Failed to load the image.")
            return
        }
        // Test on the @2x devices
        guard UIScreen.main.scale == 2 else { return }

        XCTAssertEqual(cgImage.width, 4)
        XCTAssertEqual(cgImage.height, 4)

        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 0))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 1, y: 0))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 2, y: 0))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 3, y: 0))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)

        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 1))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 1, y: 1))?.cgColor.isEqualWithConversion(to: UIColor.black.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 2, y: 1))?.cgColor.isEqualWithConversion(to: UIColor.black.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 3, y: 1))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)

        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 2))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 1, y: 2))?.cgColor.isEqualWithConversion(to: UIColor.black.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 2, y: 2))?.cgColor.isEqualWithConversion(to: UIColor.black.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 3, y: 2))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)

        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 0, y: 3))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 1, y: 3))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 2, y: 3))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
        XCTAssertEqual(cgImage.colorAt(CGPoint(x: 3, y: 3))?.cgColor.isEqualWithConversion(to: UIColor.white.cgColor), true)
    }
}
