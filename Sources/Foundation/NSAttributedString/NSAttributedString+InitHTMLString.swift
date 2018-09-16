//
//  NSAttributedString+InitHTMLString.swift
//  SExtensions
//
//  Created by Ray on 2018/9/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /// Initializes and returns a new attributed string object from the
    /// HTML string.
    ///
    /// - Parameter htmlString: A HTML string.
    /// - Throws: An in-out variable containing an encountered error, if
    ///   any.
    convenience init(htmlString: String) throws {
        try self.init(data: Data(htmlString.utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
    
}
