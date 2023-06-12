//
//  String.swift
//  spotify-clone
//
//  Created by Dani on 12/6/23.
//

import Foundation

extension String {
    /// Capitalizes the first letter of the string.
    var capitalizedFirstLetter: String {
        guard let firstLetter = self.first else {
            return self
        }
        return firstLetter.uppercased() + self.dropFirst()
    }
    /// True when string contains only alphanumeric
    var isAlphanumeric: Bool {
        let alphanumericSet = CharacterSet.alphanumerics
        return rangeOfCharacter(from: alphanumericSet.inverted) == nil
    }
}
