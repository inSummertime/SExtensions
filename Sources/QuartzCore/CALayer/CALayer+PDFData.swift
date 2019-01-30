//
//  CALayer+PDFData.swift
//  SExtensions
//
//  Created by Ray on 2019/1/4.
//  Copyright © 2019 Ray. All rights reserved.
//

import QuartzCore

public extension CALayer {

    /// NSData for creating a pdf.
    var pdfData: NSData? {
        let data = NSMutableData()
        UIGraphicsBeginPDFContextToData(data, bounds, nil)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        UIGraphicsBeginPDFPage()
        render(in: context)
        UIGraphicsEndPDFContext()
        return data
    }
}
