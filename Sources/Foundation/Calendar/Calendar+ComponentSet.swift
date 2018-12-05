//
//  Calendar+ComponentSet.swift
//  SExtensions
//
//  Created by Ray on 2018/8/15.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Calendar {

    /// A set of all available calendar components for getting
    /// DateComponents values.
    static var componentSet: Set<Calendar.Component> {
        return [.era, .year, .month, .day, .hour, .minute, .second, .weekdayOrdinal, .weekOfMonth, .weekOfYear, .yearForWeekOfYear, .weekday]
    }

    /// A set of all calendar components for getting a day DateComponents
    /// values.
    static var dayComponentSet: Set<Calendar.Component> {
        return [.year, .month, .day]
    }

    /// A set of all calendar components for a day and time DateComponents
    /// value.
    static var dayAndTimeComponentSet: Set<Calendar.Component> {
        return [.year, .month, .day, .hour, .minute, .second]
    }

}
