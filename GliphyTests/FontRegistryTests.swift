//
//  FontRegistryTests.swift
//  Gliphy
//
//  Created by Scott Williams on 3/8/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import XCTest
@testable import Gliphy

class FontRegistryTests: XCTestCase {
    
    func testRetrieveSize() {
        DynamicFontRegistry.registry.addTextStyle("ReallyBigFont", scaledFrom: UIFontTextStyleTitle1, byFactor: 1.2)
        let result = DynamicFontRegistry.registry.scaledFontSizeForStyle("ReallyBigFont")
        XCTAssertNotNil(result)
        XCTAssertNotEqual(result, 12.0)
    }
    
    func testNilRetrieval() {
        let result = DynamicFontRegistry.registry.scaledFontSizeForStyle("DoesNotExist")
        XCTAssertNil(result)
    }
    
}
