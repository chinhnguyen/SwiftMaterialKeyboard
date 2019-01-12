//
//  String.swift
//  SwiftMaterialKeyboard
//
//  Created by Chinh Nguyen on 2/28/17.
//  Copyright © 2017 Willbe Technology. All rights reserved.
//

import Foundation

extension String {
    /// Return the left string with given length.
    ///
    /// - Parameter length: The length to take.
    /// - Returns: The left string with given length.
    func left(_ length: Int) -> String {
        if self.count > length {
            return "\(self[..<self.index(self.startIndex, offsetBy: length)])"
        } else {
            return self
        }
    }
    
    /// Return the remaining string at given index.
    ///
    /// - Parameter index: The start index.
    /// - Returns: The sub string started with given index.
    func right(from index: Int) -> String {
        return "\(self[self.index(self.startIndex, offsetBy: index)...])"
    }
    
    /// Pad right with space/dot to desired length.
    ///
    /// - Parameters:
    ///   - length: The expected length.
    ///   - char: The character to pad, default to space.
    /// - Returns: Right padded string with expected length.
    func padRight(_ length: Int, char: String = " ") -> String {
        return self.padding(toLength: length, withPad: char, startingAt: 0)
    }
    
    /// Pad left with space to desired length.
    ///
    /// - Parameter length: The expected length.
    /// - Returns: Left padded string with expected length.
    func padLeft(_ length: Int) -> String {
        let charCount = self.count
        if charCount < length {
            return String(repeatElement(" ", count: length - charCount)) + self
        } else {
            return "\(self[index(self.startIndex, offsetBy: charCount - length)...])"
        }
    }
    
    func exact(_ length: Int) -> String {
        return self.left(length).padRight(length)
    }
}
