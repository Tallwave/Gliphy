//
//  StyleWatcher.swift
//  Gliphy
//
//  Created by Scott Williams on 4/30/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

/**
 `StyleWatcher` will watch a view's subviews and apply the appropriate textStyle to it via the `DynamicTypeManager`.
 */
struct StyleWatcher {
    /// An empty config object that is used if one is not passed into the watch methods.
    static var defaultConfig = StyleConfig()

    /**
     Recursively enumerates over all of the subviews in `container`. If any of the subviews have an appropriate dynamic type textstyle applied, they will be added to the `DynamicTypeManager`.
     
     - Parameter inView: The container view to enumerate over.
     - Parameter withConfig: A `StyleConfig` to use on any appropriate views.
    */
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

    /**
     If `button` has an appropriate textStyle in the `config`, add it to the `DynamicTypeManager`

     - Parameter button: The button to watch.
     - Parameter withConfig: A `StyleConfig` to use if the button's style stored within.
     */
    func watchButton(button: UIButton, withConfig config: StyleConfig) {
        guard let textStyle = button.textStyle,
            customFontName = config.button[textStyle] else { return }
        Gliphy.sharedInstance.watchButton(button, textStyle: textStyle, fontName: customFontName!)
    }

    /**
     If `label` has an appropriate textStyle in the `config`, add it to the `DynamicTypeManager`

     - Parameter label: The button to watch.
     - Parameter withConfig: A `StyleConfig` to use if the button's style stored within.
     */
    func watchLabel(label: UILabel, withConfig config: StyleConfig) {
        guard let textStyle = label.textStyle,
            customFontName = config.label[textStyle] else { return }
        Gliphy.sharedInstance.watchLabel(label, textStyle: textStyle, fontName: customFontName!)
    }

    /**
     If `textField` has an appropriate textStyle in the `config`, add it to the `DynamicTypeManager`

     - Parameter textField: The text field to watch.
     - Parameter withConfig: A `StyleConfig` to use if the button's style stored within.
     */
    func watchTextField(textField: UITextField, withConfig config: StyleConfig) {
        guard let textStyle = textField.textStyle,
            customFontName = config.textField[textStyle] else { return }
        Gliphy.sharedInstance.watchTextField(textField, textStyle: textStyle, fontName: customFontName!)
    }

    /**
     If `textView` has an appropriate textStyle in the `config`, add it to the `DynamicTypeManager`

     - Parameter textView: The text view to watch.
     - Parameter withConfig: A `StyleConfig` to use if the button's style stored within.
     */
    func watchTextView(textView: UITextView, withConfig config: StyleConfig) {
        guard let textStyle = textView.textStyle,
            customFontName = config.textView[textStyle] else { return }
        Gliphy.sharedInstance.watchTextView(textView, textStyle: textStyle, fontName: customFontName!)
    }
}
