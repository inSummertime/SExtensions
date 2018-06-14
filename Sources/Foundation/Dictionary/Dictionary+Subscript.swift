//
//  Dictionary+Subscript.swift
//  SExtensions
//
//  Created by Ray on 2018/6/13.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension Dictionary where Key == String {
    
    subscript(string key: String) -> String? {
        get {
            return self[key] as? String
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(stringValue key: String) -> String {
        get {
            return self[key] as? String ?? ""
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(int key: String) -> Int? {
        get {
            return self[key] as? Int
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(intValue key: String) -> Int {
        get {
            return self[key] as? Int ?? 0
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(double key: String) -> Double? {
        get {
            return self[key] as? Double
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(doubleValue key: String) -> Double {
        get {
            return self[key] as? Double ?? 0.0
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(array key: String) -> [Any]? {
        get {
            return self[key] as? [Any]
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(arrayValue key: String) -> [Any] {
        get {
            return self[key] as? [Any] ?? [Any]()
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(dictionary key: String) -> [String: Any]? {
        get {
            return self[key] as? [String: Any]
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
    subscript(dictionaryValue key: String) -> [String: Any] {
        get {
            return self[key] as? [String: Any] ?? [String: Any]()
        }
        set {
            self[key] = newValue as? Value
        }
    }
    
}
