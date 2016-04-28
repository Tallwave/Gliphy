//
//  StyleConfig.swift
//  Gliphy
//
//  Created by Scott Williams on 4/9/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

typealias StyleConfigDictionary = [String: String?] // textStyle: customFontName

struct StyleConfig {
    var button = StyleConfigDictionary()
    var label = StyleConfigDictionary()

    func watchViews() {
        let btns = [UIButton()]
        for btn in btns {
            guard let textStyle = btn.titleLabel?.font.fontDescriptor().fontAttributes()["sdf"]  as? String else { break }
            if let customFontName = button[textStyle] {
                Gliphy.sharedInstance.watchButton(btn, textStyle: UIFontTextStyleBody, fontName: customFontName!)
            }

        }
    }
}

//struct StyleConfigKey<T: UIView> {
//    var style: String
//}
//
//extension StyleConfigKey: Hashable {
//
//    var hashValue: Int {
//        return 1
//    }
//}
//
//func ==<T>(lhs: StyleConfigKey<T>, rhs: StyleConfigKey<T>) -> Bool {
//    return true
//}

class Herp {
    func doStuff() {
        var config = StyleConfig()
        config.button[UIFontTextStyleBody] = "Arial"
//        let x = StyleConfigKey<UILabel>(style: UIFontTextStyleBody)
//        let y = StyleConfigKey<UIButton>(style: UIFontTextStyleBody)
//        let d: [StyleConfigKey: String] = [x: "hi", y: "label"]
    }
}
