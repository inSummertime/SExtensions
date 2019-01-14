//
//  TimeZone+UTC.swift
//  SExtensions
//
//  Created by Ray on 2018/8/12.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension TimeZone {

    /// UTC time zone.
    static var UTC: TimeZone {
        return TimeZone(identifier: "UTC")!
    }
}
