//
//  MutableArray+CodableHelpers.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-05.
//

import Foundation

// Add simple helper method of creating a new array out of the current while adding a new element
extension Array {
    internal func appending(_ element: Element) -> Array<Element> {
        var rtn: Array<Element> = Array<Element>()
        rtn.append(contentsOf: self)
        rtn.append(element)
        return rtn
    }
}
