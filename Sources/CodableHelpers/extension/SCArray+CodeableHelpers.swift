//
//  SCArray+CodeableHelpers.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-23.
//

import Foundation
import SwiftClassCollections

// Adding add method so to help source code be able to swap between NSArray and SCArray
internal extension SCArray {
    func add(_ element: Element) {
        self.append(element)
    }
}
