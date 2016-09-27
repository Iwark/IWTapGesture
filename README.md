# IWTapGesture.swift

[![Version](https://img.shields.io/cocoapods/v/IWTapGesture.svg?style=flat)](http://cocoapods.org/pods/IWTapGesture)
[![License](https://img.shields.io/cocoapods/l/IWTapGesture.svg?style=flat)](http://cocoapods.org/pods/IWTapGesture)
[![Platform](https://img.shields.io/cocoapods/p/IWTapGesture.svg?style=flat)](http://cocoapods.org/pods/IWTapGesture)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

IWTapGesture is easily customizable tap gesture recognizer with effects.

## Example Usage

This is from [Demo](https://github.com/Iwark/IWTapGesture/tree/master/Demo) project.

```swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    var tapGesture: IWTapGesture!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let options:[IWTapGestureOption] = [
            IWTapGestureOption.alpha(0.5),
            IWTapGestureOption.backgroundColor(UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)),
            IWTapGestureOption.scale(0.98),
            IWTapGestureOption.scaleDuration(0.1)
        ]
        self.tapGesture = IWTapGesture(view: self.cardView, action: {
            print("View tapped!")
        }, options: options)
    }
}
```

## Runtime Requirements

* iOS 8.0 or later
* Xcode 8.0 - Swift3

## Installation

### CocoaPods

IWTapGesture is available through [CocoaPods](http://cocoapods.org).

To install add the following line to your Podfile:

    pod 'IWTapGesture'

### Carthage

IWTapGesture is also available through [Carthage](https://github.com/carthage/carthage).

Add following line to Cartfile and follow [this instruction](https://github.com/carthage/carthage#adding-frameworks-to-an-application).

```
github "Iwark/IWTapGesture"
```

**Manual Installation**

The class file required for IWTapGesture is located in the IWTapGesture folder in the root of this repository as listed below:

* IWTapGesture.swift

## Contribution

Please file issues or submit pull requests for anything you’d like to see! :)

## License

IWTapGesture is released under the MIT license.