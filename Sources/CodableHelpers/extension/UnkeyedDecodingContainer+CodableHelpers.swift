//
//  UnkeyedDecodingContainer+CodableHelpers.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-08-05.
//
// Added decodeIfPresent methods with default values

import Foundation

// Ints
public extension UnkeyedDecodingContainer {
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Int8.Type, withDefaultValue value: Int8) throws -> Int8 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Int16.Type, withDefaultValue value: Int16) throws -> Int16 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Int32.Type, withDefaultValue value: Int32) throws -> Int32 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Int64.Type, withDefaultValue value: Int64) throws -> Int64 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Int.Type, withDefaultValue value: Int) throws -> Int {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
}

// UInts
public extension UnkeyedDecodingContainer {
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: UInt8.Type, withDefaultValue value: UInt8) throws -> UInt8 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: UInt16.Type, withDefaultValue value: UInt16) throws -> UInt16 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: UInt32.Type, withDefaultValue value: UInt32) throws -> UInt32 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: UInt64.Type, withDefaultValue value: UInt64) throws -> UInt64 {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: UInt.Type, withDefaultValue value: UInt) throws -> UInt {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
}

// Other
public extension UnkeyedDecodingContainer {
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Bool.Type, withDefaultValue value: Bool) throws -> Bool {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Float.Type, withDefaultValue value: Float) throws -> Float {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: Double.Type, withDefaultValue value: Double) throws -> Double {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent(_ type: String.Type, withDefaultValue value: String) throws -> String {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decodeIfPresent<T>(_ type: T.Type, withDefaultValue value: T) throws -> T where T : Decodable {
        guard let v = try self.decodeIfPresent(type) else { return value }
        return v
    }
}
