//
//  Extensions.swift
//  Gliphy
//
//  Created by Scott Williams on 4/30/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

extension UILabel {
    var textStyle: String? {
        return font.fontDescriptor().fontAttributes()[Util.dynamicTextAttribute] as? String
    }
}

extension UIButton {
    var textStyle: String? {
        return titleLabel?.font.fontDescriptor().fontAttributes()[Util.dynamicTextAttribute] as? String
    }
}

extension UITextField {
    var textStyle: String? {
        return font?.fontDescriptor().fontAttributes()[Util.dynamicTextAttribute] as? String
    }
}

extension UITextView {
    var textStyle: String? {
        return font?.fontDescriptor().fontAttributes()[Util.dynamicTextAttribute] as? String
    }
}