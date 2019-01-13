//
//  KeyboardButton+FAK.swift
//  SwiftMaterialKeyboard_Example
//
//  Created by Chinh Nguyen on 1/13/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import SwiftMaterialKeyboard
import FontAwesomeKit

extension KeyboardButton {
    /// Init for normal keyboard.
    ///
    /// - Parameters:
    ///   - icon: The GMDIcon to be displayed.
    ///   - row: The row to be displayed.
    ///   - column: The column to be displayed
    ///   - rowSpan: The row span.
    ///   - columnSpan: The column span.
    ///   - action: The action to be performed.
    static func create(for icon: @autoclosure () -> FAKIcon, row: Int, column: Int, rowSpan: Int = 1, columnSpan: Int = 1, action: KeyAction? = nil) -> KeyboardButton {
        let button = KeyboardButton()
        button.setIcon(icon)
        button.action = action
        button.row = row
        button.column = column
        button.rowSpan = rowSpan
        button.columnSpan = columnSpan
        return button
    }
    
    /// Set icon with text and font.
    ///
    /// - Parameters:
    ///   - getIcon: to get the icon.
    ///   - text: the text string to set.
    func setIcon(_ getIcon: @autoclosure () -> FAKIcon, withText text: String? = nil) {
        let color = titleColor(for: .normal)
        let font = titleLabel?.font
        let icon = getIcon()
        icon.addAttribute(NSAttributedStringKey.foregroundColor.rawValue, value: color)
        let str = NSMutableAttributedString(attributedString: icon.attributedString())
        if let text = text, !text.isEmpty {
            str.append(NSAttributedString(string: "  \(text)", attributes: [
                NSAttributedStringKey.foregroundColor: color as Any,
                NSAttributedStringKey.font: font as Any]))
        }
        setAttributedTitle(str, for: .normal)
    }
}
