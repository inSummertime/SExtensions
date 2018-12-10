//
//  Bundle+Info.swift
//  SExtensions
//
//  Created by Ray on 2018/8/28.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Bundle {

    /// The version number.
    var version: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// The build number.
    var build: String? {
        return infoDictionary?[kCFBundleVersionKey as String] as? String
    }

    /// The app name.
    var appName: String? {
        return infoDictionary?[kCFBundleNameKey as String] as? String
    }

    /// The display name.
    var displayName: String? {
        return infoDictionary?["CFBundleDisplayName"] as? String
    }

    /// The bundle ID.
    var bundleID: String? {
        return infoDictionary?[kCFBundleIdentifierKey as String] as? String
    }

}
