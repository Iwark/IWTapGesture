//
//  ViewController.swift
//  Demo
//
//  Created by Kohei Iwasaki on 9/27/16.
//  Copyright © 2016 Antelos. All rights reserved.
//

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
            print("押されたよ！")
        }, options: options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

