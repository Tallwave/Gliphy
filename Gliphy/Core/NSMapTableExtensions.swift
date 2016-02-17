//
//  NSMapTableExtensions.swift
//  Gliphy
//
//  Created by Scott Williams on 2/16/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//
// Taken from http://nshipster.com/nshashtable-and-nsmaptable/

import Foundation

/// Allows subscripting on an `NSMapTable`.
extension NSMapTable {
    subscript(key: AnyObject) -> AnyObject? {
        get {
            return objectForKey(key)
        }

        set {
            if newValue != nil {
                setObject(newValue, forKey: key)
            } else {
                removeObjectForKey(key)
            }
        }
    }
}