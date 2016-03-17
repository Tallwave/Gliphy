//
//  GliphyTests.swift
//  GliphyTests
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import XCTest
@testable import Gliphy

class GliphyTests: XCTestCase {

    func testFontBuilder() {
        let font = DynamicTypeManager.sharedInstance.fontForTextStyle(UIFontTextStyleHeadline, fontName: "Georgia")
        XCTAssertEqual("Georgia", font.familyName)
    }
    
    func testFontBuilderWithBadStyle() {
        let font = DynamicTypeManager.sharedInstance.fontForTextStyle("bad font", fontName: "Georgia")
        let defaultFontSize: CGFloat = 12.0
        XCTAssertEqual(defaultFontSize, font.pointSize)
    }
    
    func testFontBuilderWithBadFont() {
        let font = DynamicTypeManager.sharedInstance.fontForTextStyle(UIFontTextStyleHeadline, fontName: "bad font")
        let expectedFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        XCTAssertEqual(expectedFont, font)
    }
}
