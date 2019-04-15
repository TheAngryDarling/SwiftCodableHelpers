//
//  DictionaryKeyCodable.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-30.
//

import Foundation

public struct _DictionaryKeyCodableLock {
    fileprivate init() { }
}

/*
 Dictionary Codable Keys
 Used to define available coding keys.
 Protocol is locked for implementation, but available for checking
*/
public protocol DictionaryKeyCodable: Codable {
    static var _protoLock: _DictionaryKeyCodableLock { get }
}

internal extension DictionaryKeyCodable {
    var dynamicCodingKey: CodableKey {
        if let v = self as? String {
            return CodableKey(stringValue: v)
        } else if let v = self as? Int {
            return CodableKey(intValue: v)
        } else if let v = self as? Int8 {
            return CodableKey(intValue: Int(v))
        } else if let v = self as? Int16 {
            return CodableKey(intValue: Int(v))
        } else if let v = self as? Int32 {
            return CodableKey(intValue: Int(v))
        } else if let v = self as? Int64 {
            return CodableKey(intValue: Int(v))
        } else if let v = self as? UInt8 {
            return CodableKey(intValue: Int(v))
        } else if let v = self as? UInt16 {
            return CodableKey(intValue: Int(v))
        } else if let v = self as? UInt32 {
            return CodableKey(intValue: Int(v))
        } else {
            fatalError("Invalid DictionaryKeyCodable.  Expected either String or Int")
        }
    }
}

extension String: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}

extension Int: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}

extension Int8: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}

extension UInt8: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}

extension Int32: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}

extension UInt32: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}

extension Int64: DictionaryKeyCodable {
    public static var _protoLock: _DictionaryKeyCodableLock { return _DictionaryKeyCodableLock() }
}




