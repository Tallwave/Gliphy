//
//  ViewController.swift
//  ExampleApp
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit
import Gliphy

class ViewController: UIViewController {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var tapme: UIButton!
    @IBOutlet weak var customStyleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = "ReallyReallyBigFont"
        Gliphy.DynamicFontRegistry.registry.addTextStyle(style, scaledFrom: UIFontTextStyleTitle1, byFactor: 1.5)
        
        DynamicTypeManager.sharedInstance.watchLabel(heading, textStyle: UIFontTextStyleHeadline, fontName: "Georgia")
        DynamicTypeManager.sharedInstance.watchButton(tapme, textStyle: UIFontTextStyleBody, fontName: "Georgia")
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Gliphy.DynamicTypeManager.sharedInstance.watchLabel(customStyleLabel, textStyle: "ReallyReallyBigFont", fontName: "Helvetica")
    }
}

