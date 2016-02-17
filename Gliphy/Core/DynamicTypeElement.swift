//
//  DynamicTypeElement.swift
//  Gliphy
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import Foundation

/**
 A wrapper around all of the attributes needed when the content size updates. Not a Struct because those can't be stored in `NSMapTable`.
*/
class DynamicTypeElement {
    let keyPath: String
    let textStyle: String
    let fontName: String

    init(keyPath: String, textStyle: String, fontName: String) {
        self.keyPath = keyPath
        self.textStyle = textStyle
        self.fontName = fontName
    }
}