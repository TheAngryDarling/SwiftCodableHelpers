//
//  KeyedDecodingContainerProtocol+CodableHelpers.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-08-05.
//
// Added decodeIfPresent methods with default values

import Foundation


// Ints
public extension KeyedDecodingContainerProtocol {
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Int8.Type, forKey key: Self.Key, withDefaultValue value: Int8) throws -> Int8 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Int16.Type, forKey key: Self.Key, withDefaultValue value: Int16) throws -> Int16 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Int32.Type, forKey key: Self.Key, withDefaultValue value: Int32) throws -> Int32 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Int64.Type, forKey key: Self.Key, withDefaultValue value: Int64) throws -> Int64 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Int.Type, forKey key: Self.Key, withDefaultValue value: Int) throws -> Int {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
}

// UInts
public extension KeyedDecodingContainerProtocol {
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: UInt8.Type, forKey key: Self.Key, withDefaultValue value: UInt8) throws -> UInt8 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: UInt16.Type, forKey key: Self.Key, withDefaultValue value: UInt16) throws -> UInt16 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: UInt32.Type, forKey key: Self.Key, withDefaultValue value: UInt32) throws -> UInt32 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: UInt64.Type, forKey key: Self.Key, withDefaultValue value: UInt64) throws -> UInt64 {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: UInt.Type, forKey key: Self.Key, withDefaultValue value: UInt) throws -> UInt {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
}

// Other
public extension KeyedDecodingContainerProtocol {
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Bool.Type, forKey key: Self.Key, withDefaultValue value: Bool) throws -> Bool {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Float.Type, forKey key: Self.Key, withDefaultValue value: Float) throws -> Float {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Double.Type, forKey key: Self.Key, withDefaultValue value: Double) throws -> Double {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: String.Type, forKey key: Self.Key, withDefaultValue value: String) throws -> String {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
    
    /// Decodes a value of the given type for the given key, if present, otherwise returns the default value
    ///
    /// This method returns a default value if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - parameter value: The default value to return if key does not exist
    /// - returns: A decoded value of the requested type, or default value if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent<T>(_ type: T.Type, forKey key: Self.Key, withDefaultValue value: T) throws -> T where T : Decodable {
        guard let v = try self.decodeIfPresent(type, forKey: key) else { return value }
        return v
    }
}
