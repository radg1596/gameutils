//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 17/02/21.
//

import Foundation

/// Gets a localizable string from a given enumerator type. Use the case rawValue as the key to found the localizable string.
public protocol GUEnumStringLocalizable {
    /// Localize the string for given case menu rawValue
    var localize: String { get }
}

public extension GUEnumStringLocalizable where Self: RawRepresentable {

    var localize: String {
        guard let rawValue: String = rawValue as? String else {
            return "fatalErrorStringNotFound"
        }
        let tableName: String = String(describing: Self.self)
        return rawValue.localized(tableName: tableName)
    }

}
