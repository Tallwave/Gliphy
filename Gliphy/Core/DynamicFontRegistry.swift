//
//  DynamicFontRegistry.swift
//  Gliphy
//
//  Created by Scott Williams on 3/8/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

/**
 `ScaledFontDescriptor` describes how to scale a font with a specific text style.
*/
struct ScaledFontDescriptor {
    let originalTextStyle: String
    let scaleAmount: Float
}

/**
 `DynamicFontRegistry` contains a list of custom font sizes that can be used with Dynamic Type. You can register a custom style that is a scaled version of an existing font style defined by iOS. When the custom font is retrieved it is scaled appropriately along with all the other fonts.
*/
public class DynamicFontRegistry {
    
    /**
     The singleton instance of `DynamicFontRegistry`.
    */
    public static let registry = DynamicFontRegistry()
    
    private init() {}
    
    private var styleDictionary = [String: ScaledFontDescriptor]()
    
    /**
     Registers a custom text style.
     
     - Parameter textStyle: The unique identifier for to be registered.
     - Parameter scaledFrom: The built-in text style on which this is based.
     - Parameter byFactor: The multiplier to scale the custom font by.
    */
    public func addTextStyle(textStyle: String, scaledFrom originalTextStyle: String, byFactor scaleAmount: Float) {
        styleDictionary[textStyle] = ScaledFontDescriptor(originalTextStyle: originalTextStyle, scaleAmount: scaleAmount)
    }
    
    /**
     Retrieves a registered font size and scales it. If the text style was not registered, `nil` is returned.
     
     - Parameter textStyle: The identifier to look up.
    */
    func scaledFontSizeForStyle(textStyle: String) -> CGFloat? {
        if let descriptor = styleDictionary[textStyle] {
            let baseFont = UIFont.preferredFontForTextStyle(descriptor.originalTextStyle)
            return baseFont.pointSize * CGFloat(descriptor.scaleAmount)
        }
        return nil
    }
}
