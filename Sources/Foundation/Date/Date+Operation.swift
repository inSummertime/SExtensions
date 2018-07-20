//
//  Date+Operation.swift
//  SExtensions
//
//  Created by Ray on 2018/7/17.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Returns a new `Date` by adding a dictionary of calendar component and
    /// Int value to this `Date`.
    ///
    ///     print(Date(timeIntervalSinceReferenceDate: 0).addingComponentDictionary([.second: 1], in: Calendar(identifier: Calendar.Identifier.gregorian)))
    ///     // Prints "Optional(2001-01-01 00:00:01 +0000)"
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of calendar component and Int value.
    ///   - calendar: A calendar.
    /// - Returns: A new date, or nil if a date could not be calculated with
    ///   the given input.
    func addingComponentDictionary(_ dictionary: [Calendar.Component: Int], in calendar: Calendar = Calendar.current) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dictionary.forEach { (key, value) in
            dateComponents.setValue(value, for: key)
        }
        return calendar.date(byAdding: dateComponents, to: self)
    }
    
    /// Returns a new `Date` by updating a dictionary of calendar component
    /// and Int value.
    ///
    ///     print(Date(timeIntervalSinceReferenceDate: 0).updatingComponentDictionary([.day: 2, .hour: 1, .minute: 1], in: Calendar(identifier: Calendar.Identifier.gregorian)))
    ///     // Prints "Optional(2001-01-02 01:01:00 +0000)"
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of calendar component and Int value.
    ///   - calendar: A calendar.
    /// - Returns: A new date, or nil if a date could not be calculated with
    ///   the given input.
    func updatingComponentDictionary(_ dictionary: [Calendar.Component: Int], in calendar: Calendar = Calendar.current) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        var hasInvalidValue = false
        dictionary.forEach { (key, value) in
            if value <= 0 {
                hasInvalidValue = true
            } else {
                let currentValue = calendar.component(key, from: self)
                dateComponents.setValue(value - currentValue, for: key)
            }
        }
        if hasInvalidValue {
            return nil
        }
        return calendar.date(byAdding: dateComponents, to: self)
    }
    
}
