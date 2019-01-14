//
//  PinPad.swift
//  SwiftMaterialKeyboard_Example
//
//  Created by Chinh Nguyen on 1/13/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import SwiftMaterialKeyboard
import FontAwesomeKit

class PinPad: MaterialKeyboard {
    override var rowCount: Int { return 4 }
    override var columnCount: Int { return 4 }
    
    override func createReturnButton() -> KeyboardButton? {
        return KeyboardButton.create(for: FAKMaterialIcons.longArrowReturnIcon(withSize: 24), row: 2, column: 3, rowSpan: 2)
    }
    
    override func createButtons() -> [KeyboardButton] {
        let prev = KeyboardButton.create(for: FAKMaterialIcons.longArrowTabIcon(withSize: 24), row: 0, column: 3, action: .next)
        prev.transform = CGAffineTransform(rotationAngle: .pi)
        return [
            KeyboardButton.create(for: "1", row: 0, column: 0),
            KeyboardButton.create(for: "2", row: 0, column: 1),
            KeyboardButton.create(for: "3", row: 0, column: 2),
            KeyboardButton.create(for: "4", row: 1, column: 0),
            KeyboardButton.create(for: "5", row: 1, column: 1),
            KeyboardButton.create(for: "6", row: 1, column: 2),
            KeyboardButton.create(for: "7", row: 2, column: 0),
            KeyboardButton.create(for: "8", row: 2, column: 1),
            KeyboardButton.create(for: "9", row: 2, column: 2),
            KeyboardButton.create(for: "0", row: 3, column: 1),
            KeyboardButton.create(for: "CLR", row: 3, column: 0, action: .clear),
            KeyboardButton.create(for: FAKMaterialIcons.arrowLeftIcon(withSize: 24), row: 3, column: 2, action: .backspace),
            prev,
            KeyboardButton.create(for: FAKMaterialIcons.longArrowTabIcon(withSize: 24), row: 1, column: 3, action: .next),
            self.returnButton!
        ]
    }
}
