//
//  KeyboardButton.swift
//  SwiftMaterialKeyboard
//
//  Created by Chinh Nguyen on 4/15/18.
//  Copyright © 2018 Willbe Technology. All rights reserved.
//

import Foundation
import Material

/// Generic keyboard button
open class KeyboardButton: RaisedButton {
    var theme = KeyboardTheme()
    open var action: KeyAction? = nil
    open var row: Int = 0
    open var column: Int = 0
    open var rowSpan: Int = 1
    open var columnSpan: Int = 1
    
    open override func prepare() {
        super.prepare()
        backgroundColor = UIColor(hex: 0xe6e6e6)
        titleLabel?.font = theme.heading2Font
        setTitleColor(theme.primary.base, for: .normal)
        setTitleColor(theme.warn.base, for: .highlighted)
    }
    
    override open var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.25
        }
    }
}

// MARK: - Factory
extension KeyboardButton {
    /// Create for normal keyboard.
    ///
    /// - Parameters:
    ///   - char: The title to be displayed.
    ///   - row: The row to be displayed.
    ///   - column: The column to be displayed
    ///   - rowSpan: The row span.
    ///   - columnSpan: The column span.
    ///   - action: The action to be performed, nil equal to normal key action with title as key.
    public static func create(for title: String, row: Int, column: Int, rowSpan: Int = 1, columnSpan: Int = 1, action: KeyAction? = nil) -> KeyboardButton {
        let button = KeyboardButton()
        button.setTitle(title, for: .normal)
        button.action = action ?? KeyAction.char(title)
        button.row = row
        button.column = column
        button.rowSpan = rowSpan
        button.columnSpan = columnSpan
        return button
    }
}
