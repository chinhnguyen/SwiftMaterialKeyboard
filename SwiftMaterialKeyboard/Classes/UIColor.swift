//
//  UIColor.swift
//  SwiftMaterialKeyboard
//
//  Created by Chinh Nguyen on 4/14/18.
//  Copyright © 2018 Willbe Technology. All rights reserved.
//

import Foundation

internal extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hex: String) {
        if let hexInt = UIColor.toColorInt(hex) {
            self.init(hex: hexInt)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
    static func toColorInt(_ hex: String) -> Int? {
        let trimmedValue = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        return Int(trimmedValue, radix: 16)
    }
}
