//
//  AdvancedViewController.swift
//  Gliphy
//
//  Created by Scott Williams on 4/30/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

struct ConfigSetup {
    static func setup() {
        var config = StyleConfig()
        config.label[UIFontTextStyleHeadline] = "Verdana"
        config.label[UIFontTextStyleCaption1] = "MarkerFelt-Thin"
        config.button[UIFontTextStyleHeadline] = "Verdana"
        config.textField[UIFontTextStyleBody] = "Verdana"
        config.textField[UIFontTextStyleCaption1] = "Helvetica"
        StyleWatcher.defaultConfig = config
    }
}

class WatcherViewController: UIViewController, UITextFieldDelegate {

    let watcher = StyleWatcher()

    override func viewDidLoad() {
        super.viewDidLoad()
        watcher.watchViews(inView: view)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
