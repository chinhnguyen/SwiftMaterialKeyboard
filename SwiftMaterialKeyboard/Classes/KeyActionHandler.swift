//
//  KeyActionHandler.swift
//  FontAwesomeKit
//
//  Created by Chinh Nguyen on 1/14/19.
//

import Foundation

typealias KeyCustomHandler = () -> Void

public protocol KeyActionHandler {
    func interested(in: KeyAction) -> Bool
    func apply(key: KeyAction, to field: UITextField)
}

/// For handling fields navigation (tab)
open class KeyNavigationHandler {
    public var textFields: [UITextField] = []
    func move(nextOf field: UITextField?) -> UITextField? {
        // No given field, just try to return the first element on list
        guard let field = field else { return textFields.first }
        // If the text fields is empty, return the field itself
        guard !textFields.isEmpty else { return field }
        // Try to locate the field inside the managed text fields
        guard var index = textFields.index(of: field) else { return textFields.first! }
        index += 1 // Move next
        if index == textFields.count { index = 0 } // Circle back
        let target = textFields[index]
        if target.isEnabled {
            target.becomeFirstResponder()
            return target
        } else { return move(nextOf: target) }
    }
    func move(previousOf field: UITextField?) -> UITextField? {
        // No given field, just try to return the last element on list
        guard let field = field else { return textFields.last }
        // If the text fields is empty, return the field itself
        guard !textFields.isEmpty else { return field }
        // Try to locate the field inside the managed text fields
        guard var index = textFields.index(of: field) else { return textFields.first! }
        index -= 1 // Move prev
        if index < 0 { index = textFields.count - 1 } // Circle back
        let target = textFields[index]
        if target.isEnabled {
            target.becomeFirstResponder()
            return target
        } else { return move(previousOf: target) }
    }
}

