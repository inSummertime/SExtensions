//
//  String+Is.swift
//  SExtensions
//
//  Created by Ray on 2018/9/14.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension String {

    /// Checks whether it is a phone number.
    ///
    ///     print("800–692–7753".isPhoneNumber)
    ///     // Prints "true"
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: count))
            if let first = matches.first {
                return first.resultType == .phoneNumber && first.range.location == 0 && first.range.length == count
            } else {
                return false
            }
        } catch {
            return false
        }
    }

    /// Checks whether it is an email.
    ///
    ///     print("123@a.com".isEmail)
    ///     // Prints "true"
    var isEmail: Bool {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
