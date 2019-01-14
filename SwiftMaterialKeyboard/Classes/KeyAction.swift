//
//  KeyAction.swift
//  FontAwesomeKit
//
//  Created by Chinh Nguyen on 1/14/19.
//

import Foundation

/// The content modification action key.
///
/// - char: Append char to the end of text.
/// - clear: Clear text.
/// - backspace: Remove the last char at the end of text.
/// - add: Add 1, the text field handler should take care of this.
/// - minus: Minus 2, the text field handler should take care of this.
public enum KeyAction {
    case char(_: String)
    case clear
    case caplock
    case backspace
    case add(_: UInt)
    case minus(_: UInt)
    case next
    case prev
    
    public var isNavigation: Bool {
        switch self {
        case .next: fallthrough
        case .prev: return true
        default: return false
        }
    }
    
    public func apply(to field: UITextField?, allCaps: Bool = false) {
        // Require an active field to do the work
        guard let field = field else { return }
        // Let the text field do it first
        if let handler = field as? KeyActionHandler, handler.interested(in: self) {
            return handler.apply(key: self, to: field)
        }
        // Default handler
        guard field.isFirstResponder else { return }
        
        let text = field.text ?? ""
        
        switch self {
        case .char(var char):
            if allCaps { char = char.uppercased() }
            field.text = "\(text)\(char)"
        case .clear:
            field.text = ""
        case .backspace:
            if !text.isEmpty {
                field.text = text.exact(text.count-1)
            } else {
                field.text = ""
            }
        default: return
        }
        // Send action to mimic value changed
        field.sendActions(for: .valueChanged)
    }
}
