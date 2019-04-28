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

//Adds a simple string representation of the coding path
extension Array where Element == CodingKey {
    public var stringPath: String {
        var rtn = self.map({ return $0.stringValue }).joined(separator: "/")
        if !rtn.hasPrefix("/") { rtn = "/" + rtn }
        return rtn
    }
    
    internal func appending(stringValue value: String) -> Array<CodingKey> {
        return self.appending(CodableKey(stringValue: value))
    }
    
    internal func appending(intValue value: Int) -> Array<CodingKey> {
        return self.appending(CodableKey(intValue: value))
    }
    
    internal func appending(index value: Int) -> Array<CodingKey> {
        return self.appending(CodableKey(index: value))
    }
}

extension ArraySlice where Element == CodingKey {
    public var stringPath: String {
        return self.map({ return $0.stringValue }).joined(separator: "/")
    }
}

extension Slice where Base.Element == CodingKey {
    public var stringPath: String {
        return self.map({ return $0.stringValue }).joined(separator: "/")
    }
}
