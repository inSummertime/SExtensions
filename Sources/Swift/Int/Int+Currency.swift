//
//  Int+Currency.swift
//  SExtensions
//
//  Created by Ray on 2018/9/5.
//  Copyright © 2018 Ray. All rights reserved.
//

public extension Int {

    /// Returns a local currency string.
    ///
    ///     if Locale.current.identifier == "en_US" {
    ///         print(100.localCurrency)
    ///     }
    ///     // Prints "$100"
    var localCurrency: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self))
    }

    /// Returns an US dollar string.
    ///
    ///     print(100.USDollar == "$100" || 100.USDollar == "US$100")
    ///     // Prints "true"
    var USDollar: String? {
        return currency(currencyCode: "USD")
    }

    /// Returns a currency string with a currency code.
    ///
    ///     print((-100).currency(currencyCode: "USD").USDollar == "-$100" || (-100).currency(currencyCode: "USD").USDollar == "-US$100")
    ///     // Prints "true"
    ///
    /// - Parameter currencyCode: A currency code is a three-letter code that
    ///   is, in most cases, composed of a country’s two-character Internet
    ///   country code plus an extra character to denote the currency unit.
    /// - Returns: A string.
    func currency(currencyCode: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self))
    }

}
