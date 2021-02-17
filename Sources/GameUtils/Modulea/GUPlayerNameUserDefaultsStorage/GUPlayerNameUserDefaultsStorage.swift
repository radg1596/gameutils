//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 16/02/21.
//

import Foundation

/// Used to store the user player name on the userDefaults, using the default standart.
public class GUPlayerNameUserDefaultsStorage {

    // MARK: - PROPERTIES
    /// The storage key in order to use on user defaults. Default value is: "PlayerNameUserDefaultsStorage"
    public var storageKey: String
    /// The current name storaged on user defaults, nil if still not saved anything
    public var currentUserName: String? {
        return UserDefaults.standard.string(forKey: storageKey)
    }

    // MARK: INIT
    public init() {
        storageKey = "PlayerNameUserDefaultsStorage"
    }

    // MARK: - METHODS
    /// Saves a new user name
    /// - Parameter userName: The desired name to save
    public func saveNew(userName: String) {
        UserDefaults.standard.setValue(userName, forKey: storageKey)
    }

    /// Clears the name saved on the given user defaults key
    public func clearName() {
        UserDefaults.standard.removeObject(forKey: storageKey)
    }

}
