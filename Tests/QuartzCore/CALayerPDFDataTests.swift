//
//  CALayerPDFDataTests.swift
//  SExtensionsTests
//
//  Created by Ray on 2019/1/4.
//  Copyright © 2019 Ray. All rights reserved.
//

@testable import SExtensions
import XCTest

final class CALayerPDFDataTests: XCTestCase {

    func testPDFData() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.backgroundColor = .white
        let subview = UIView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        subview.backgroundColor = .black
        view.addSubview(subview)
        guard let url = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first else { return }
        let URL = url.appendingPathComponent("view.pdf")
        view.layer.pdfData?.write(to: URL, atomically: true)
        do {
            let data = try NSData(contentsOf: URL) as CFData
            guard let provider = CGDataProvider(data: data) else {
                XCTFail("Cannot create CGDataProvider.")
                return
            }
            guard let pdfDoc = CGPDFDocument(provider) else {
                XCTFail("Cannot create CGPDFDocument.")
                return
            }
            XCTAssertEqual(pdfDoc.numberOfPages, 1)
        } catch {
            // Nothing
        }
    }
}
