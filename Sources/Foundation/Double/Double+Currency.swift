//
//  Double+Currency.swift
//  SExtensions
//
//  Created by Ray on 2018/7/9.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Returns an US dollar string.
    ///
    ///     print(100.0.USDollar == "$100.00" || 100.0.USDollar == "US$100.00")
    ///     // Prints "true"
    var USDollar: String? {
        return currency(currencyCode: "USD")
    }
    
    /// Returns a currency string.
    ///
    ///     print((-100.0091111).currency(currencyCode: "USD").USDollar == "-$100.01" || (-100.0091111).currency(currencyCode: "USD").USDollar == "-US$100.01")
    ///     // Prints "true"
    ///
    /// - Parameter currencyCode: A currency code is a three-letter code that
    ///   is, in most cases, composed of a country’s two-character Internet
    ///   country code plus an extra character to denote the currency unit.
    /// - Returns: A string
    func currency(currencyCode: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.negativeFormat = "-¤#,##0.00"
        return formatter.string(from: NSNumber(value: self))
    }
    
}
