//
//  Date+Adding.swift
//  SExtensions
//
//  Created by Ray on 2018/7/16.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Return a new `Date` by adding a dictionary of calendar component and
    /// Int value to this `Date`.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of calendar component and Int value
    ///   - calendar: A calendar
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
    
}
