//
//  KLKeyboard.swift
//  SwiftMaterialKeyboard
//
//  Created by Chinh Nguyen on 2/27/17.
//  Copyright © 2017 Willbe Technology. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Material

/// The base class for all keyboards, should not use this instance directly but via one of its child classes.
open class MaterialKeyboard: Material.View {
    let disposeBag = DisposeBag()
    
    // MARK: - Styling
    
    /// Return the number of rows.
    open var rowCount: Int { return 4 }
    
    /// Return the number of columns.
    open var columnCount: Int { return 4 }
    
    /// Margin around a button
    open var keyMargin: Int { return 4 }
    
    /// Margin around a button
    var keyMarginX2: Int { return keyMargin * 2 }
    
    /// Size of a button in term of 1x1
    open var keySize: CGSize { return CGSize(width: 64, height: 64) }
    
    /// The border thickness.
    open var borderThickness: Int = 4
    
    /// Total width of the keyboard
    open var expectedWidth: Int { return (Int(keySize.width) + keyMarginX2) * columnCount + borderThickness * 2 + keyMarginX2 }
    
    /// Total width of the keyboard
    open var expectedHeight: Int { return (Int(keySize.height) + keyMarginX2) * rowCount  + borderThickness * 2 + keyMarginX2 }
    
    override open var intrinsicContentSize: CGSize {
        return CGSize(width: expectedWidth, height: expectedHeight)
    }
    
    // MARK: - Buttons

    /// Child class provide its own definition for buttons.
    open lazy var buttons: [KeyboardButton] = { return createButtons() }()
    open func createButtons() -> [KeyboardButton] {
        return []
    }
    
    /// Return the common return button.
    open lazy var returnButton: KeyboardButton? = { return createReturnButton() }()
    open func createReturnButton() -> KeyboardButton? {
        return nil
    }

    /// Caplocks indicator
    open func createCaplockButton() -> KeyboardButton? {
        return nil
    }
    open lazy var caplockButton: KeyboardButton? = { return createCaplockButton() }()

    /// The navigation handler
    open lazy var navigationHandler: KeyNavigationHandler = KeyNavigationHandler()
    
    // MARK: - Input fields
    
    /// Return ALL the text field that are bound to this keyboard.
    open var textFields: [UITextField] = [] {
        didSet {
            self.navigationHandler.textFields = textFields
        }
    }
    
    /// Return the current active text field.
    open var currentTextField: UITextField?
    
    /// `true` if upppercase.
    open var allCaps = false {
        didSet {
            if let button = caplockButton, let color = allCaps ? button.titleColor(for: .highlighted) : button.titleColor(for: .normal) {
                button.set(iconColor: color)
            }
            for button in buttons {
                if let title = button.title(for: .normal) {
                    button.setTitle(allCaps ? title.uppercased() : title.lowercased(), for: .normal)
                }
            }
        }
    }
    
    // MARK: - Layout
    
    /// Layout buttons as configured.
    override open func prepare() {
        super.prepare()
        
        clipsToBounds = true

        backgroundColor = UIColor(hex: 0x1d2d36)
        layer.borderWidth = CGFloat(borderThickness)
        layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        layer.cornerRadius = 2.0

        // Populate key buttons
        for button in buttons {
            addSubview(button)
            button.snp.makeConstraints { make in
                make.width.equalTo((Int(keySize.width) + keyMarginX2) * button.columnSpan - keyMarginX2)
                make.height.equalTo((Int(keySize.height) + keyMarginX2) * button.rowSpan - keyMarginX2)
                make.left.equalTo((Int(keySize.width) + keyMarginX2) * button.column + keyMarginX2 + borderThickness)
                make.top.equalTo((Int(keySize.height) + keyMarginX2) * button.row + keyMarginX2 + borderThickness)
            }
            // Hook tap
            button.rx.tap
                .subscribe(onNext: { _ in
                    // No action - no thing to do
                    guard let action = button.action else { return }
                    self.updateFirstResponder()
                    switch action {
                    case .next: self.currentTextField = self.navigationHandler.move(nextOf: self.currentTextField)
                    case .prev: self.currentTextField = self.navigationHandler.move(previousOf: self.currentTextField)
                    case .caplock: self.allCaps = !self.allCaps
                    default: action.apply(to: self.currentTextField, allCaps: self.allCaps)
                    }
                })
                .disposed(by: disposeBag)
        }
    }
    
    /// Try to set the active text field.
    final func updateFirstResponder() {
        // If the current text field is the first responder, just ignore
        if let currentTextField = self.currentTextField, currentTextField.isFirstResponder {
            return
        }
        // Find the first responder
        self.currentTextField = textFields.first(where: { t in t.isFirstResponder })
    }
}
