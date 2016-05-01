//
//  StyleConfig.swift
//  Gliphy
//
//  Created by Scott Williams on 4/9/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

typealias StyleConfigDictionary = [String: String?] // textStyle: customFontName

struct StyleConfig {
    var button = StyleConfigDictionary()
    var label = StyleConfigDictionary()
    var textField = StyleConfigDictionary()
    var textView = StyleConfigDictionary()
}

struct StyleWatcher {
    static var defaultConfig = StyleConfig()

    func watchViews(inView container: UIView, withConfig config: StyleConfig = defaultConfig) {
        for view in container.subviews {
            switch view {
            case view as UIButton: watchButton(view as! UIButton, withConfig: config)
            case view as UILabel: watchLabel(view as! UILabel, withConfig: config)
            case view as UITextView: watchTextView(view as! UITextView, withConfig: config)
            case view as UITextField: watchTextField(view as! UITextField, withConfig: config)
            default:
                watchViews(inView: view, withConfig: config)
            }
        }
    }

    func watchButton(btn: UIButton, withConfig config: StyleConfig) {
        guard let textStyle = btn.textStyle,
            customFontName = config.button[textStyle] else { return }
        Gliphy.sharedInstance.watchButton(btn, textStyle: UIFontTextStyleBody, fontName: customFontName!)
    }

    func watchLabel(label: UILabel, withConfig config: StyleConfig) {
        guard let textStyle = label.textStyle,
            customFontName = config.label[textStyle] else { return }
        Gliphy.sharedInstance.watchLabel(label, textStyle: UIFontTextStyleBody, fontName: customFontName!)
    }

    func watchTextField(textField: UITextField, withConfig config: StyleConfig) {
        guard let textStyle = textField.textStyle,
            customFontName = config.textField[textStyle] else { return }
        Gliphy.sharedInstance.watchTextField(textField, textStyle: UIFontTextStyleBody, fontName: customFontName!)
    }

    func watchTextView(textView: UITextView, withConfig config: StyleConfig) {
        guard let textStyle = textView.textStyle,
            customFontName = config.textView[textStyle] else { return }
        Gliphy.sharedInstance.watchTextView(textView, textStyle: UIFontTextStyleBody, fontName: customFontName!)
    }
}
