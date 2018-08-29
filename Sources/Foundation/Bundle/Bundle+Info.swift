//
//  Bundle+Info.swift
//  SExtensions
//
//  Created by Ray on 2018/8/28.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var version: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var build: String? {
        return infoDictionary?[kCFBundleVersionKey as String] as? String
    }
    
    var appName: String? {
        return infoDictionary?[kCFBundleNameKey as String] as? String
    }
    
    var displayName: String? {
        return infoDictionary?["CFBundleDisplayName"] as? String
    }
    
    var bundleID: String? {
        return infoDictionary?[kCFBundleIdentifierKey as String] as? String
    }
    
}
