//
//  IWTapGesture.swift
//  IWTapGesture
//
//  Created by Kohei Iwasaki on 9/27/16.
//  Copyright © 2016 Antelos. All rights reserved.
//

import UIKit

public enum IWTapGestureOption {
    case alpha(CGFloat)
    case backgroundColor(UIColor)
    case scale(CGFloat)
    case scaleDuration(TimeInterval)
}

open class IWTapGesture: NSObject {
    
    var alpha:CGFloat?
    var toBackgroundColor:UIColor?
    var scale: CGFloat?
    var scaleDuration: TimeInterval = 0.1
    var beganBackgroundColor = UIColor.clear
    var action: (()->Void)?
    
    public init(view: UIView, action: (()->Void)?, options: [IWTapGestureOption]?) {
        super.init()
        self.action = action
        if let options = options {
            self.setupForOptions(options)
        }
        let rec = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        rec.minimumPressDuration = 0.001
        view.addGestureRecognizer(rec)
    }
    
    func setupForOptions(_ options: [IWTapGestureOption]) {
        for option in options {
            switch option {
            case let .alpha(alpha):
                self.alpha = alpha
            case let .backgroundColor(color):
                self.toBackgroundColor = color
            case let .scale(scale):
                self.scale = scale
            case let .scaleDuration(d):
                self.scaleDuration = d
            }
        }
    }
    
    func handleGesture(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            if let v = sender.view {
                // 透過
                if let alpha = self.alpha {
                    for sv in v.subviews {
                        sv.alpha = alpha
                    }
                }
                // 背景色
                if let bg = self.toBackgroundColor {
                    self.beganBackgroundColor = v.backgroundColor ?? UIColor.clear
                    v.backgroundColor = bg
                }
                // 縮小
                if let scale = self.scale {
                    UIView.animate(withDuration: self.scaleDuration, animations: {
                        for sv in v.subviews {
                            sv.transform = CGAffineTransform(scaleX: scale, y: scale)
                        }
                    })
                }
            }
        case .ended, .cancelled, .failed:
            if let v = sender.view {
                // 透過を戻す
                if self.alpha != nil {
                    for sv in v.subviews {
                        sv.alpha = 1.0
                    }
                }
                // 背景色を戻す
                if self.toBackgroundColor != nil {
                    v.backgroundColor = self.beganBackgroundColor
                }
                // 縮小を戻す
                if self.scale != nil {
                    UIView.animate(withDuration: self.scaleDuration, animations: {
                        for sv in v.subviews {
                            sv.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        }
                    })
                }
                if let action = self.action {
                    let location = sender.location(in: v)
                    let touchInside = v.bounds.contains(location)
                    if touchInside {
                        action()
                    }
                }
            }
        default:
            break
        }
    }
    
}
