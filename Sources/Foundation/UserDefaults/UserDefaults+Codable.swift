//
//  UserDefaults+Codable.swift
//  SExtensions
//
//  Created by Ray on 2018/8/18.
//  Copyright © 2018 Ray. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    /// Searches the receiver's search list for a default with
    /// the key 'defaultName' and converts the returned value to a
    /// Codable object and returns nil if no value or the value is
    /// not Codable.
    ///
    ///     struct Object: Codable {
    ///         let id: Int
    ///     }
    ///     let object = Object(id: 0)
    ///     let key = "HelloWorld!"
    ///     UserDefaults.standard.setCodable(object, forKey: key)
    ///     print(UserDefaults.standard.codable(Object.self, forKey: key)!.id == 0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - type: A Codable type.
    ///   - defaultName: The key to search with.
    /// - Returns: A Decodable object or nil.
    func codable<T: Codable>(_ type: T.Type, forKey defaultName: String) -> T? {
        guard let data = object(forKey: defaultName) as? Data else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }
    
    /// Stores an Encodable value (or removes the value if nil is
    /// passed as the value) for the provided key in the search list
    /// entry for the receiver's suite name in the current user and
    /// any host, then asynchronously stores the value persistently,
    /// where it is made available to other processes.
    ///
    ///     struct Object: Codable {
    ///         let id: Int
    ///     }
    ///     let object = Object(id: 0)
    ///     let key = "HelloWorld!"
    ///     UserDefaults.standard.setCodable(object, forKey: key)
    ///     print(UserDefaults.standard.codable(Object.self, forKey: key)!.id == 0)
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - value: The Encodable value to store.
    ///   - defaultName: The provided key.
    func setCodable<T: Codable>(_ value: T, forKey defaultName: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
    
}
