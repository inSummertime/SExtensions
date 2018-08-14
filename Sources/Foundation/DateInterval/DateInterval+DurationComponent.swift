//
//  DateInterval+DurationComponent.swift
//  SExtensions
//
//  Created by Ray on 2018/8/8.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension DateInterval {
    
    /// Returns the value for one component of the duration.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: Date.timeIntervalPerWeek)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     print(dateInterval.durationComponent(.weekOfMonth, in: calendar) == 1)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - component: The component to calculate.
    ///   - calendar: A calendar.
    /// - Returns: The value for one component
    func durationComponent(_ component: Calendar.Component, in calendar: Calendar) -> Int? {
        if component == .calendar || component == .timeZone || component == .quarter || component == .nanosecond {
            return nil
        }
        return calendar.dateComponents([component], from: start, to: end).value(for: component)
    }
    
    /// Returns a component dictionary of the duration.
    ///
    ///     let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 0), duration: Date.timeIntervalPerWeek * 58)
    ///     let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    ///     let dictionary = dateInterval.durationComponentDictionary([.era, .year, .month, .weekOfMonth, .day, .hour, .minute, .second], in: calendar)
    ///     print(dictionary[.year]! == 1)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - components: A component set.
    ///   - calendar: A calendar.
    /// - Returns: A component dictionary
    func durationComponentDictionary(_ components: Set<Calendar.Component>, in calendar: Calendar) -> [Calendar.Component: Int] {
        let dateComponents = calendar.dateComponents(components, from: start, to: end)
        var dictionary = [Calendar.Component: Int]()
        for component in Date.calendarComponentSet {
            if let value = dateComponents.value(for: component), value != NSDateComponentUndefined {
                dictionary[component] = value
            }
        }
        return dictionary
    }

}
