# SwiftMaterialKeyboard

[![CI Status](https://img.shields.io/travis/chinhnguyen/SwiftMaterialKeyboard.svg?style=flat)](https://travis-ci.org/chinhnguyen/SwiftMaterialKeyboard)
[![Version](https://img.shields.io/cocoapods/v/SwiftMaterialKeyboard.svg?style=flat)](https://cocoapods.org/pods/SwiftMaterialKeyboard)
[![License](https://img.shields.io/cocoapods/l/SwiftMaterialKeyboard.svg?style=flat)](https://cocoapods.org/pods/SwiftMaterialKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/SwiftMaterialKeyboard.svg?style=flat)](https://cocoapods.org/pods/SwiftMaterialKeyboard)

## Description
In some application, the default keyboard provided by Apple is just not enough, we need more control over the position and also behavior of the on-screen keyboard. For example: we need the Qwerty keyboard to be smaller and always visible that can be tucked to a screen corner instead of taking half of the screen.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftMaterialKeyboard is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftMaterialKeyboard'
```

## Create keyboard
To create a custom keyboard, create a new class which inherits from `MaterialKeyboard` and define the desired number of rows and columns by overriding `rowCount` and  `columnCount`. Each key will be placed just like an `HTML` table's cell with position for `row`, `column` and the desired `rowSpan` or `columnSpan`.

This is the `PinPad` which can be found in `Example` project:
```swift
class PinPad: MaterialKeyboard {
    override var rowCount: Int { return 4 }
    override var columnCount: Int { return 4 }
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
            KeyboardButton.create(for: FAKMaterialIcons.longArrowReturnIcon(withSize: 24), row: 2, column: 3, rowSpan: 2)
        ]
    }
}
```

And this is how it looks like in a real application:

![](https://drive.google.com/uc?export=view&id=1YJajEH4lkPBL9bDmNDgpcQq_t-Z_-URg)

## Author

Chinh Nguyen, chinh@willbe.vn

## License

SwiftMaterialKeyboard is available under the MIT license. See the LICENSE file for more info.
