//
//  KeyedEncodingContainerProtocol+CodableHelpers.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-08-06.
//

import Foundation

/// Ints
public extension KeyedEncodingContainerProtocol {
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int8, forKey key: Self.Key, ifNot nValue: Int8) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int16, forKey key: Self.Key, ifNot nValue: Int16) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int32, forKey key: Self.Key, ifNot nValue: Int32) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int64, forKey key: Self.Key, ifNot nValue: Int64) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int, forKey key: Self.Key, ifNot nValue: Int) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int8?, forKey key: Self.Key, andNot nValue: Int8) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int16?, forKey key: Self.Key, andNot nValue: Int16) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int32?, forKey key: Self.Key, andNot nValue: Int32) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int64?, forKey key: Self.Key, ifNot nValue: Int64) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int?, forKey key: Self.Key, ifNot nValue: Int) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
}

/// UInts
public extension KeyedEncodingContainerProtocol {
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt8, forKey key: Self.Key, ifNot nValue: UInt8) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt16, forKey key: Self.Key, ifNot nValue: UInt16) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt32, forKey key: Self.Key, ifNot nValue: UInt32) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt64, forKey key: Self.Key, ifNot nValue: UInt64) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt, forKey key: Self.Key, ifNot nValue: UInt) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt8?, forKey key: Self.Key, andNot nValue: UInt8) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt16?, forKey key: Self.Key, andNot nValue: UInt16) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt32?, forKey key: Self.Key, andNot nValue: UInt32) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt64?, forKey key: Self.Key, ifNot nValue: UInt64) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt?, forKey key: Self.Key, ifNot nValue: UInt) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    
}

// other
public extension KeyedEncodingContainerProtocol {
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Bool, forKey key: Self.Key, ifNot nValue: Bool) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Bool?, forKey key: Self.Key, andNot nValue: Bool) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Float, forKey key: Self.Key, ifNot nValue: Float) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Float?, forKey key: Self.Key, andNot nValue: Float) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Double, forKey key: Self.Key, ifNot nValue: Double) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Double?, forKey key: Self.Key, andNot nValue: Double) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: String, forKey key: Self.Key, ifNot nValue: String) throws {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: String?, forKey key: Self.Key, andNot nValue: String) throws {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode<T>(_ value: T, forKey key: Self.Key, ifNot nValue: T) throws where T: Encodable, T: Equatable {
        guard value != nValue else { return }
        try self.encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent<T>(_ value: T?, forKey key: Self.Key, andNot nValue: T) throws where T: Encodable, T: Equatable {
        guard let value = value else { return }
        try self.encode(value, forKey: key, ifNot: nValue)
    }
}
