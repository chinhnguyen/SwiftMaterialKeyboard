//
//  KeyboardTheme.swift
//  SwiftMaterialKeyboard
//
//  Created by Chinh Nguyen on 1/11/19.
//  Copyright © 2019 Willbe. All rights reserved.
//

import Foundation
import Material

class KeyboardTheme {
    var primary: ColorPalette.Type {
        return Color.teal.self
    }
    
    var secondary: ColorPalette.Type {
        return Color.grey.self
    }
    
    var warn: ColorPalette.Type {
        return Color.deepOrange.self
    }
    
    var textColor: UIColor {
        return Color.darkText.primary
    }
    
    var secondaryTextColor: UIColor {
        return Color.darkText.secondary
    }
    
    var titleFont: UIFont {
        return RobotoFont.medium(with: 32.0)
    }
    
    var subTitleFont: UIFont {
        return RobotoFont.medium(with: 30.0)
    }
    
    var heading1Font: UIFont {
        return RobotoFont.medium(with: 24.0)
    }
    
    var heading2Font: UIFont {
        return RobotoFont.medium(with: 20.0)
    }
    
    var heading3Font: UIFont {
        return RobotoFont.medium(with: 18.0)
    }
    
    var normalFontSize: CGFloat { return 16.0 }
    
    var normalFont: UIFont {
        return RobotoFont.medium(with: normalFontSize)
    }
    
    func normalFont(_ scale: CGFloat) -> UIFont {
        return RobotoFont.medium(with: normalFontSize * scale)
    }
    
    var normalBoldFont: UIFont {
        return RobotoFont.bold(with: normalFontSize)
    }
    
    func normalBoldFont(_ scale: CGFloat) -> UIFont {
        return RobotoFont.bold(with: normalFontSize * scale)
    }
    
    // TODO: italic font
    var normalItalicFont: UIFont {
        return RobotoFont.medium(with: normalFontSize)
    }
    
    var smallFont: UIFont {
        return RobotoFont.medium(with: 14.0)
    }
    
    var smallBoldFont: UIFont {
        return RobotoFont.bold(with: 14.0)
    }
    
    var xsmallFont: UIFont {
        return RobotoFont.medium(with: 12.0)
    }
    
    var xsmallBoldFont: UIFont {
        return RobotoFont.bold(with: 12.0)
    }
    
    var titleBoldFont: UIFont {
        return RobotoFont.bold(with: 32.0)
    }
    
    var subTitleBoldFont: UIFont {
        return RobotoFont.bold(with: 30.0)
    }
    
    var heading1BoldFont: UIFont {
        return RobotoFont.bold(with: 24.0)
    }
    
    var heading2BoldFont: UIFont {
        return RobotoFont.bold(with: 20.0)
    }
    
    var heading3BoldFont: UIFont {
        return RobotoFont.bold(with: 18.0)
    }
    
    var normalInputFont: UIFont {
        return RobotoFont.bold(with: 16.0)
    }
    
    var largeInputFont: UIFont {
        return RobotoFont.bold(with: 18.0)
    }
    
    var xlargeInputFont: UIFont {
        return RobotoFont.bold(with: 20.0)
    }
    
    var xxlargeInputFont: UIFont {
        return RobotoFont.bold(with: 24.0)
    }
    
    var xxxlargeInputFont: UIFont {
        return RobotoFont.bold(with: 30.0)
    }
    
    var headerBackground: UIColor {
        return self.primary.base
    }
    
    var headerTextColor: UIColor {
        return Material.Color.lightText.primary
    }
    
    var headerSecondaryTextColor: UIColor {
        return Material.Color.lightText.secondary
    }
}
