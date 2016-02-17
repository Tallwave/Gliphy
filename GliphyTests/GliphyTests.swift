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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFontBuilder() {
        let font = DynamicTypeManager.sharedInstance.fontForTextStyle(UIFontTextStyleTitle1, fontName: "Georgia")
        XCTAssertEqual("Georgia", font.familyName)
    }
    
    func testFontBuilderWithBadStyle() {
        let font = DynamicTypeManager.sharedInstance.fontForTextStyle("bad font", fontName: "Georgia")
        let defaultFontSize: CGFloat = 12.0
        XCTAssertEqual(defaultFontSize, font.pointSize)
    }
    
    func testFontBuilderWithBadFont() {
        let font = DynamicTypeManager.sharedInstance.fontForTextStyle(UIFontTextStyleTitle1, fontName: "bad font")
        let expectedFont = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        XCTAssertEqual(expectedFont, font)
    }
}
