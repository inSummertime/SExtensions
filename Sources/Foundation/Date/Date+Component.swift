//
//  Date+Component.swift
//  SExtensions
//
//  Created by Ray on 2018/7/23.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Date {
    
    /// The value for year component in current calendar.
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// The value for month component in current calendar.
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// The value for day component in current calendar.
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    /// The value for hour component in current calendar.
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// The value for minute component in current calendar.
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    /// The value for second component in current calendar.
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    /// Returns the value for one component.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     print(date.component(.year, in: calendar))
    ///     // Prints "2001"
    ///
    /// - Parameters:
    ///   - component: The component to calculate.
    ///   - calendar: A calendar.
    /// - Returns: The value for one component.
    func component(_ component: Calendar.Component, in calendar: Calendar) -> Int {
        return calendar.component(component, from: self)
    }
    
}
