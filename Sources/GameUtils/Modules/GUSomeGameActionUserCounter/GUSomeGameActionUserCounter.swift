//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 03/03/21.
//

import Foundation

/**
 Class for count some user actions. For example, the number of times to ask about app review, the number of times about show a teaching moment, etc. Requires an optional bussiness logic additional object. Saves the counter on the storage key.
*/
public class GUSomeGameActionUserCounter {

    // MARK: - PROPERTIES
    /// The storage key to use on user defaults standar, has default value as `GUSomeGameActionUserCounterDefaultKey`
    public var storageKey: String
    /// The max count of the counter, the default value is 3
    public var maxCounts: Int
    private let incrementCounterInt: Int

    // MARK: INIT
    public init() {
        storageKey = "GUSomeGameActionUserCounterDefaultKey"
        maxCounts = 3
        incrementCounterInt = 1
    }

    // MARK: - EXPOSED METHODS AND CALCULATED PROPERTIES
    /// Increments the counter of the specific game action, using the current storage key. For example, from zero to one...
    public func incrementCounter() {
        let currentCount: Int = UserDefaults.standard.integer(forKey: storageKey)
        let nextCurrentCount: Int = currentCount + incrementCounterInt
        UserDefaults.standard.setValue(nextCurrentCount, forKey: storageKey)
    }

    /// Returns if the maximum counts has reached
    public var maxCountsReached: Bool {
        let currentCount: Int = UserDefaults.standard.integer(forKey: storageKey)
        return currentCount >= maxCounts
    }

    /// Reset the current saved counter to zero
    public func resetCounter() {
        UserDefaults.standard.setValue(Int.zero, forKey: storageKey)
    }

    /// The current number of counts saved on the storage key
    public var currentCounts: Int {
        return UserDefaults.standard.integer(forKey: storageKey)
    }

}
