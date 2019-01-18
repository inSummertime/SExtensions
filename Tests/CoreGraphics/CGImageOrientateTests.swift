//
//  CGImageOrientateTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/18.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CGImageOrientateTests: XCTestCase {
    
    var cgImage: CGImage?
    var scale: CGFloat?
    
    override func setUp() {
        let size = CGSize(width: 32, height: 64)
        let view = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        view.layer.addBorder(color: .black, width: 1, side: .top)
        view.layer.addBorder(color: .black, width: 1, side: .right)
        view.layer.render(in: context)
        cgImage = context.makeImage()
        scale = UIGraphicsGetImageFromCurrentImageContext()?.scale
    }
    
    override func tearDown() {
        UIGraphicsEndImageContext()
    }

    func testOrientateUp() {
        guard let newCGImage = cgImage?.orientate(.up) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 32, height: 64)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .top)
        anotherView.layer.addBorder(color: .black, width: 1, side: .right)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    func testOrientateUpMirrored() {
        guard let newCGImage = cgImage?.orientate(.upMirrored) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 32, height: 64)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .top)
        anotherView.layer.addBorder(color: .black, width: 1, side: .left)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    
    func testOrientateRight() {
        guard let newCGImage = cgImage?.orientate(.right) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 64, height: 32)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .right)
        anotherView.layer.addBorder(color: .black, width: 1, side: .bottom)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    func testOrientateRightMirrored() {
        guard let newCGImage = cgImage?.orientate(.rightMirrored) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 64, height: 32)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .top)
        anotherView.layer.addBorder(color: .black, width: 1, side: .right)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    func testOrientateDown() {
        guard let newCGImage = cgImage?.orientate(.down) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 32, height: 64)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .bottom)
        anotherView.layer.addBorder(color: .black, width: 1, side: .left)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    func testOrientateDownMirrored() {
        guard let newCGImage = cgImage?.orientate(.downMirrored) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 32, height: 64)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .right)
        anotherView.layer.addBorder(color: .black, width: 1, side: .bottom)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    func testOrientateLeft() {
        guard let newCGImage = cgImage?.orientate(.left) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 64, height: 32)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .top)
        anotherView.layer.addBorder(color: .black, width: 1, side: .left)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
    
    func testOrientateLeftMirrored() {
        guard let newCGImage = cgImage?.orientate(.leftMirrored) else { return }
        guard let scale = scale else { return }
        let newImage = UIImage(cgImage: newCGImage, scale: scale, orientation: .up)
        let size = CGSize(width: 64, height: 32)
        let anotherView = UIView(frame: CGRect(origin: .zero, size: size))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        anotherView.layer.addBorder(color: .black, width: 1, side: .bottom)
        anotherView.layer.addBorder(color: .black, width: 1, side: .left)
        anotherView.layer.render(in: context)
        guard let anotherImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        XCTAssertEqual(UIImagePNGRepresentation(newImage), UIImagePNGRepresentation(anotherImage))
    }
}
