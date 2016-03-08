//
//  DynamicTypeManager.swift
//  Gliphy
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit
/**
 `DynamicTypeManager` is a singleton that watches for the `UIContentSizeCategoryDidChangeNotification` notification and then updates all views to the new size accordingly. By default, Dynamic Type only works with the system font. Gliphy allows any font installed to be substituted.
*/
public class DynamicTypeManager {

    struct Values {
        static let fontKeyPathUILabel =   "font"
        static let fontKeyPathUIButton =  "titleLabel.font"
        static let fontKeyPathTextField = "font"
        static let fontKeyPathTextView =  "font"
    }

    /**
     The singleton instance of `DynamicTypeManager`.
    */
    public static let sharedInstance = DynamicTypeManager()

    /// Storage and lookup for the views `DynamicTypeManager` is tracking.
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

    /**
     Start watching a `UILabel`. It's font will be defined by `fontName` and its size will be determined by the `textStyle`.
     
     - Parameter label: The `UILabel` to watch.
     - Parameter textStyle: The equivalent text style to size against.
     - Parameter fontName: The name of the custom font to use.
    */
    public func watchLabel(label: UILabel, textStyle: String, fontName: String) {
        watchElement(label, fontKeyPath: Values.fontKeyPathUILabel, textStyle: textStyle, fontName: fontName)
    }

    /**
     Start watching a `UIButton`. It's font will be defined by `fontName` and its size will be determined by the `textStyle`.

     - Parameter button: The `UIButton` to watch.
     - Parameter textStyle: The equivalent text style to size against.
     - Parameter fontName: The name of the custom font to use.
     */
    public func watchButton(button: UIButton, textStyle: String, fontName: String) {
        watchElement(button, fontKeyPath: Values.fontKeyPathUIButton, textStyle: textStyle, fontName: fontName)
    }

    /**
     Start watching a `UITextField`. It's font will be defined by `fontName` and its size will be determined by the `textStyle`.

     - Parameter textField: The `UITextField` to watch.
     - Parameter textStyle: The equivalent text style to size against.
     - Parameter fontName: The name of the custom font to use.
     */
    public func watchTextField(textField: UITextField, textStyle: String, fontName: String) {
        watchElement(textField, fontKeyPath: Values.fontKeyPathTextField, textStyle: textStyle, fontName: fontName)
    }

    /**
     Start watching a `UITextView`. It's font will be defined by `fontName` and its size will be determined by the `textStyle`.

     - Parameter textView: The `UITextView` to watch.
     - Parameter textStyle: The equivalent text style to size against.
     - Parameter fontName: The name of the custom font to use.
     */
    public func watchTextView(textView: UITextView, textStyle: String, fontName: String) {
        watchElement(textView, fontKeyPath: Values.fontKeyPathTextView, textStyle: textStyle, fontName: fontName)
    }

    /**
     Start watching any view. It's font will be defined by `fontName` and its size will be determined by the `textStyle`.

     - Parameter view: The `UIView` to watch.
     - Parameter fontKeyPath: The Key Value Coding path to the appropriate font attribute.
     - Parameter textStyle: The equivalent text style to size against.
     - Parameter fontName: The name of the custom font to use.
     */
    public func watchElement(view: UIView, fontKeyPath: String, textStyle: String, fontName: String) {
        view.setValue(fontForTextStyle(textStyle, fontName: fontName), forKeyPath: fontKeyPath)
        let typeElement = DynamicTypeElement(keyPath: fontKeyPath, textStyle: textStyle, fontName: fontName)
        elementToTypeTable.setObject(typeElement, forKey: view)
    }

    /**
     Looks up the `UIFont` with the `fontName` and the size defined by the `style`. Firsts checks the `DynamicFontRegistry` for a custom size, then the `preferredFontForTextStyle` for fonts.
     
     - Parameter style: The equivalent system font style to apply to the font.
     - Parameter fontName: The name of the non-system font.
     
     - Returns: The font with the `fontName` and size defined by the preferred font with `style`. If the `fontName` is not a valid font on the device, the system font for the `style` is used.
    */
    func fontForTextStyle(style: String, fontName: String) -> UIFont {
        if let customSize = DynamicFontRegistry.registry.scaledFontSizeForStyle(style) {
            return UIFont(name: fontName, size: customSize)!
        }
        
        let systemFont = UIFont.preferredFontForTextStyle(style)
        guard let customFont = UIFont(name: fontName, size: systemFont.pointSize) else {
            return systemFont
        }
        return customFont
    }

    /**
     Catches the notification for `UIContentSizeCategoryDidChangeNotification`. Updates all of the views stored in the internal storage.
    */
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
