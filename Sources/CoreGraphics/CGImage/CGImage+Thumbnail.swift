//
//  CGImage+Thumbnail.swift
//  SExtensions
//
//  Created by Ray on 2019/1/19.
//  Copyright © 2019 Ray. All rights reserved.
//

import CoreGraphics
import ImageIO

public extension CGImage {

    /// Return a thumbnail CGImage reading from `url' with a given size via CGImageSource.
    ///
    ///     let bundle = Bundle(for: type(of: self))
    ///     guard let url = bundle.url(forResource: "icon", withExtension: "png") else { return }
    ///     guard let cgImage = CGImage.createThumbnailWithURL(url, size: CGSize(width: 22, height: 26)) else { return }
    ///     print(cgImage.width)
    ///     // Prints "22"
    ///     print(cgImage.height)
    ///     // Prints "26"
    ///
    /// - Parameters:
    ///   - url: The URL.
    ///   - size: The size.
    /// - Returns: a CGImage.
    class func createThumbnailWithURL(_ url: URL, size: CGSize) -> CGImage? {
        guard let source = CGImageSourceCreateWithURL(url as CFURL, nil) else { return nil }
        let maxPixelSize = max(size.width, size.height)
        let options: [CFString: Any] = [kCGImageSourceThumbnailMaxPixelSize: maxPixelSize as CFNumber, kCGImageSourceCreateThumbnailFromImageAlways: true]
        return CGImageSourceCreateThumbnailAtIndex(source, 0, options as CFDictionary)
    }
}
