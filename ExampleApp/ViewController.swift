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

    override func viewDidLoad() {
        super.viewDidLoad()
        DynamicTypeManager.sharedInstance.watchLabel(heading, textStyle: UIFontTextStyleHeadline, fontName: "Georgia")
        DynamicTypeManager.sharedInstance.watchButton(tapme, textStyle: UIFontTextStyleBody, fontName: "Georgia")
    }
}

