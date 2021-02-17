//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 16/02/21.
//

import Foundation

public extension String {

    /// Gets the localizable string from a given table of string localizables
    /// - Parameters:
    ///   - bundle: The desired bundle in order to find the localizable table, default value it `Main`
    ///   - tableName: The desired table name to localize the string
    /// - Returns: Returns the localized string under the key for string (self)
    func localized(bundle: Bundle = .main, tableName: String) -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }

}
