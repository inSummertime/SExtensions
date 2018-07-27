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
    
    /// A set for all available calendar components
    static var calendarComponentSet: Set<Calendar.Component> {
        return [.era, .year, .month, .day, .hour, .minute, .second, .weekdayOrdinal, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .weekday]
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
    
    /// Returns the value for one component since a date.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let sometimeNextYear = date.addingTimeInterval(Date.timeIntervalPerWeek * 77)
    ///     print(sometimeNextYear.component(.weekOfYear, since: date, in: calendar))
    ///     // Prints "77"
    ///
    /// - Parameters:
    ///   - component: The component to calculate.
    ///   - date: A date.
    ///   - calendar: A calendar.
    /// - Returns: The value for one component
    func component(_ component: Calendar.Component, since date: Date, in calendar: Calendar) -> Int? {
        if component == .calendar || component == .timeZone || component == .quarter || component == .nanosecond {
            return nil
        }
        return calendar.dateComponents([component], from: date, to: self).value(for: component)
    }
    
    /// Returns a component dictionary since a date.
    ///
    ///     let date = Date(timeIntervalSinceReferenceDate: 0)
    ///     var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    ///     let sometimeNextYear = date.addingTimeInterval(Date.timeIntervalPerWeek * 77)
    ///     let dictionary = sometimeNextYear.componentDictionary([.year, .month, .weekOfMonth, .day], since: date, in: calendar)
    ///     print(dictionary[.year], 1)
    ///     // Prints "1"
    ///
    /// - Parameters:
    ///   - components: A component set.
    ///   - date: A date.
    ///   - calendar: A calendar.
    /// - Returns: A component dictionary
    func componentDictionary(_ components: Set<Calendar.Component>, since date: Date, in calendar: Calendar) -> [Calendar.Component: Int] {
        let dateComponents = calendar.dateComponents(components, from: date, to: self)
        var dictionary = [Calendar.Component: Int]()
        for component in Date.calendarComponentSet {
            if let value = dateComponents.value(for: component), value != NSDateComponentUndefined {
                dictionary[component] = value
            }
        }
        return dictionary
    }
    
}
