//
//  DynamicTypeManager.swift
//  Gliphy
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

public class DynamicTypeManager {

    struct Values {
        static let fontKeyPathUILabel =   "font"
        static let fontKeyPathUIButton =  "titleLabel.font"
        static let fontKeyPathTextField = "font"
        static let fontKeyPathTextView =  "font"
    }

    public static let sharedInstance = DynamicTypeManager()

    private var elementToTypeTable: NSMapTable = NSMapTable.weakToStrongObjectsMapTable()

    private init() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "contentSizeCategoryDidChange:",
            name: UIContentSizeCategoryDidChangeNotification,
            object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    public func watchLabel(label: UILabel, textStyle: String, fontName: String) {
        watchElement(label, fontKeyPath: Values.fontKeyPathUILabel, textStyle: textStyle, fontName: fontName)
    }

    public func watchButton(button: UIButton, textStyle: String, fontName: String) {
        watchElement(button, fontKeyPath: Values.fontKeyPathUIButton, textStyle: textStyle, fontName: fontName)
    }

    public func watchTextField(textField: UITextField, textStyle: String, fontName: String) {
        watchElement(textField, fontKeyPath: Values.fontKeyPathTextField, textStyle: textStyle, fontName: fontName)
    }

    public func watchTextView(textView: UITextView, textStyle: String, fontName: String) {
        watchElement(textView, fontKeyPath: Values.fontKeyPathTextView, textStyle: textStyle, fontName: fontName)
    }

    public func watchElement(view: UIView, fontKeyPath: String, textStyle: String, fontName: String) {
        view.setValue(fontForTextStyle(textStyle, fontName: fontName), forKeyPath: fontKeyPath)
        let typeElement = DynamicTypeElement(keyPath: fontKeyPath, textStyle: textStyle, fontName: fontName)
        elementToTypeTable.setObject(typeElement, forKey: view)
    }

    func fontForTextStyle(style: String, fontName: String) -> UIFont {
        let systemFont = UIFont.preferredFontForTextStyle(style)
        return UIFont(name: fontName, size: systemFont.pointSize)!
    }

    @objc public func contentSizeCategoryDidChange(notification: NSNotification) {
        let enumerator = elementToTypeTable.keyEnumerator()
        while let view = enumerator.nextObject() as? UIView {
            if let element = elementToTypeTable[view] as? DynamicTypeElement {
                let font = fontForTextStyle(element.textStyle, fontName: element.fontName)
                view.setValue(font, forKeyPath: element.keyPath)
            }
        }
    }
}
