//
//  StyleConfig.swift
//  Gliphy
//
//  Created by Scott Williams on 4/9/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

/// Keys of the dictionary are the text styles, values are the names of the custom font.
/// Example: dictionary[UIFontTextStyleHeadline] = "Verdana"
public typealias StyleConfigDictionary = [String: String?] // textStyle: customFontName

/// Container for all of the views that are supported by the DynamicTypeManager.
public struct StyleConfig {
    var button = StyleConfigDictionary()
    var label = StyleConfigDictionary()
    var textField = StyleConfigDictionary()
    var textView = StyleConfigDictionary()
}
