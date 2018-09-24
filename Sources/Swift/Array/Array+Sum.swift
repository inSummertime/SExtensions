//
//  Array+Sum.swift
//  SExtensions
//
//  Created by Ray on 2018/9/18.
//  Copyright © 2018 Ray. All rights reserved.
//

public protocol Addable {
    
    /// Adds two values and produces their sum.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    /// - Returns: Their sum.
    static func add(lhs: Self, rhs: Self) -> Self
    
    /// Returns zero or other default value.
    ///
    /// - Returns: Zero or other default value.
    static func zero() -> Self
}

extension Int: Addable {
    
    public static func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    public static func zero() -> Int {
        return 0
    }
    
}

extension Double: Addable {
    
    public static func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    public static func zero() -> Double {
        return 0
    }
    
}

extension String: Addable {
    
    public static func add(lhs: String, rhs: String) -> String {
        return lhs + rhs
    }
    
    public static func zero() -> String {
        return ""
    }
    
}

public extension Array where Element: Addable  {
    
    /// The sum of all elements.
    var sum: Element {
        return reduce( Element.zero()) { Element.add(lhs: $0, rhs: $1) }
    }
    
}
