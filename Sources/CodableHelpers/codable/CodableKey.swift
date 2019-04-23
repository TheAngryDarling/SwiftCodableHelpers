//
//  DynamicKey.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-03.
//
// Based off swift code https://github.com/apple/swift/blob/master/stdlib/public/core/Codable.swift.gyb)

import Foundation

/*
 A basic structure used to define a coding key
 */
public struct CodableKey: CodingKey {
    
    public var stringValue: String
    public var intValue: Int?
    
    public init(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    public init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    public init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }
    public init(index: Int) {
        self.stringValue = "Index \(index)"
        self.intValue = index
    }
    
    internal func properHashValue<HT>(forType tp: HT.Type) -> HT where HT: DictionaryKeyCodable {
        if let iV = self.intValue, type(of: iV) == tp {
            return iV as! HT
        } else if type(of: self.stringValue) == tp {
            return self.stringValue as! HT
        } else {
            fatalError("Unable to cast to type \(tp)")
        }
    }
    
}

extension CodableKey: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return "\(type(of: self)) (\(self.stringValue))"
    }
}

#if !_runtime(_ObjC)
extension CodableKey: CustomStringConvertible {
    public var description: String {
        return "\(type(of: self)).\(self.stringValue)"
    }
}
#endif
