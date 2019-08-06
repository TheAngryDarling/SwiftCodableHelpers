//
//  UnkeyedEncodingContainer+CodableHelpers.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-08-06.
//

import Foundation

/// Ints
public extension UnkeyedEncodingContainer {
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int8, ifNot nValue: Int8) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int16, ifNot nValue: Int16) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int32, ifNot nValue: Int32) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int64, ifNot nValue: Int64) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Int, ifNot nValue: Int) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int8?, andNot nValue: Int8) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int16?, andNot nValue: Int16) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int32?, andNot nValue: Int32) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int64?, andNot nValue: Int64) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Int?, andNot nValue: Int) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
}

/// UInts
public extension UnkeyedEncodingContainer {
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt8, ifNot nValue: UInt8) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt16, ifNot nValue: UInt16) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt32, ifNot nValue: UInt32) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt64, ifNot nValue: UInt64) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: UInt, ifNot nValue: UInt) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt8?, andNot nValue: UInt8) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt16?, andNot nValue: UInt16) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt32?, andNot nValue: UInt32) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt64?, andNot nValue: UInt64) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: UInt?, andNot nValue: UInt) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
}

/// Other
public extension UnkeyedEncodingContainer {
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Bool, ifNot nValue: Bool) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Bool?, andNot nValue: Bool) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Float, ifNot nValue: Float) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Float?, andNot nValue: Float) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Double, ifNot nValue: Double) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Double?, andNot nValue: Double) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: String, ifNot nValue: String) throws {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: String?, andNot nValue: String) throws {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode<T>(_ value: T, ifNot nValue: T) throws where T: Encodable, T: Equatable {
        guard value != nValue else { return }
        try self.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - parameter nValue: The value it should not be for encoding to occur
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent<T>(_ value: T?, andNot nValue: T) throws where T: Encodable, T: Equatable {
        guard let value = value else { return }
        try self.encode(value, ifNot: nValue)
    }
}
