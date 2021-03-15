//
//  File.swift
//  
//
//  Created by Ricardo Desiderio on 15/03/21.
//

import Foundation

public extension Double {

    /// Gets a score truncated string value, for example 3.454594, for default returns "3.4546"
    /// - Parameter format: The desired format for string, default value its "%.4f"
    /// - Returns: The score with string format
    func scoreValue(format: String = "%.4f") -> String {
        let formattedScore: String = String(format: "%.4f", self)
        return formattedScore
    }

}
