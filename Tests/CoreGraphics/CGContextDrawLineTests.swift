//
//  CGContextDrawLineTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/13.
//  Copyright © 2019 Ray. All rights reserved.
//

import XCTest
@testable import SExtensions

final class CGContextDrawLineTests: XCTestCase {

    func testDrawLine() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let points = [CGPoint.zero, CGPoint(x: 64, y: 0), CGPoint(x: 64, y: 64), CGPoint(x: 0, y: 64), CGPoint.zero]
        context?.drawLine(points: points, color: .black, lineWidth: 2)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        XCTAssertNotNil(image)
        
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0)
        guard let context2 = UIGraphicsGetCurrentContext() else { return }
        view.layer.addBorder(color: .black, width: 1)
        view.layer.render(in: context2)
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        XCTAssertNotNil(image2)
        
        XCTAssertEqual(UIImagePNGRepresentation(image!), UIImagePNGRepresentation(image2!))
    }
    
}
