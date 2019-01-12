//
//  UIButton+FAK.swift
//  Kiolyn
//
//  Created by Chinh Nguyen on 4/15/18.
//  Copyright © 2018 Willbe Technology. All rights reserved.
//

import Foundation
import RxSwift

internal extension UIButton {
    /// Change icon color for a UIButton.
    ///
    /// - Parameter color: the new color.
    func set(iconColor color: UIColor) {
        guard let attr = attributedTitle(for: .normal) else {
            return
        }
        let attrTitle = NSMutableAttributedString(attributedString: attr)
        attrTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: color as Any, range: NSMakeRange(0, attrTitle.length))
        setAttributedTitle(attrTitle, for: .normal)
    }
}
