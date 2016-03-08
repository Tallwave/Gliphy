//
//  DynamicFontRegistry.swift
//  Gliphy
//
//  Created by Scott Williams on 3/8/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

struct ScaledFontDescriptor {
    let originalTextStyle: String
    let scaleAmount: Float
}

public class DynamicFontRegistry {
    public static let registry = DynamicFontRegistry()
    
    private init() {}
    
    private var styleDictionary = [String: ScaledFontDescriptor]()
    
    public func addTextStyle(textStyle: String, scaledFrom originalTextStyle: String, byFactor scaleAmount: Float) {
        styleDictionary[textStyle] = ScaledFontDescriptor(originalTextStyle: originalTextStyle, scaleAmount: scaleAmount)
    }
    
    func scaledFontSizeForStyle(textStyle: String) -> CGFloat? {
        if let descriptor = styleDictionary[textStyle] {
            let baseFont = UIFont.preferredFontForTextStyle(descriptor.originalTextStyle)
            return baseFont.pointSize * CGFloat(descriptor.scaleAmount)
        }
        return nil
    }
}
