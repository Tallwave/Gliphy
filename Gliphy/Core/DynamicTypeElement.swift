//
//  DynamicTypeElement.swift
//  Gliphy
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import Foundation

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