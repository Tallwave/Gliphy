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
    /// Style dictionary for UIButtons
    public var button = StyleConfigDictionary()

    /// Style dictionary for UILabels
    public var label = StyleConfigDictionary()

    /// Style dictionary for UITextFields
    public var textField = StyleConfigDictionary()

    /// Style dictionary for UITextViews
    public var textView = StyleConfigDictionary()

    /// Default initializer
    public init() {}
}
