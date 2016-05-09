//
//  ViewController.swift
//  ExampleApp
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var tapme: UIButton!
    @IBOutlet weak var customStyleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = "ReallyReallyBigFont"
        DynamicFontRegistry.registry.addTextStyle(style,
                                                  scaledFrom: UIFontTextStyleHeadline,
                                                  byFactor: 4)
        
        Gliphy.sharedInstance.watchLabel(heading, textStyle: UIFontTextStyleHeadline, fontName: "Georgia")
        Gliphy.sharedInstance.watchButton(tapme, textStyle: UIFontTextStyleBody, fontName: "Georgia")
        Gliphy.sharedInstance.watchLabel(customStyleLabel, textStyle: "ReallyReallyBigFont", fontName: "Helvetica")
    }
}

