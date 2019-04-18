//
//  BaseCoders.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-27.
//
// Taken and modified from Swift source code: https://github.com/apple/swift/blob/master/stdlib/public/core/Codable.swift.gyb


import Foundation
import Nillable
import SwiftClassCollections


#if !(os(macOS) || os(iOS) || os(tvOS) || os(watchOS))
private let kCFBooleanTrue = NSNumber(booleanLiteral: true)
private let kCFBooleanFalse = NSNumber(booleanLiteral: false)
#endif
/*
 The base class for encoders
*/
open class BaseEncoder {
    
    /// The strategy to use for encoding `Date` values.
    public enum DateEncodingStrategy {
        /// Defer to `Date` for choosing an encoding. This is the default strategy.
        case deferredToDate
        
        /// Encode the `Date` as a UNIX timestamp (as a Base number).
        case secondsSince1970
        
        /// Encode the `Date` as UNIX millisecond timestamp (as a Base number).
        case millisecondsSince1970
        
        /// Encode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
        @available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
        case iso8601
        
        /// Encode the `Date` as a string formatted by the given formatter.
        case formatted(DateFormatter)
        
        /// Encode the `Date` as a custom value encoded by the given closure.
        ///
        /// If the closure fails to encode a value into the given encoder, the encoder will encode an empty automatic container in its place.
        case custom((Date, Encoder) throws -> Void)
    }
    
    /// The strategy to use for encoding `Data` values.
    public enum DataEncodingStrategy {
        /// Defer to `Data` for choosing an encoding.
        case deferredToData
        
        /// Encoded the `Data` as a Base64-encoded string. This is the default strategy.
        case base64
        
        /// Encode the `Data` as a custom value encoded by the given closure.
        ///
        /// If the closure fails to encode a value into the given encoder, the encoder will encode an empty automatic container in its place.
        case custom((Data, Encoder) throws -> Void)
    }
    
    /// The strategy to use for non-Base-conforming floating-point values (IEEE 754 infinity and NaN).
    public enum NonConformingFloatEncodingStrategy {
        /// Throw upon encountering non-conforming values. This is the default strategy.
        case `throw`
        
        /// Encode the values using the given representation strings.
        case convertToString(positiveInfinity: String, negativeInfinity: String, nan: String)
    }
    
    /// The strategy to use in encoding dates. Defaults to `.deferredToDate`.
    open var dateEncodingStrategy: DateEncodingStrategy = .deferredToDate
    
    /// The strategy to use in encoding binary data. Defaults to `.base64`.
    open var dataEncodingStrategy: DataEncodingStrategy = .base64
    
    /// The strategy to use in encoding non-conforming numbers. Defaults to `.throw`.
    open var nonConformingFloatEncodingStrategy: NonConformingFloatEncodingStrategy = .throw
    
    /// Contextual user-provided information for use during encoding.
    open var userInfo: [CodingUserInfoKey : Any] = [:]
    
    /// Options set on the top-level encoder to pass down the encoding hierarchy.
    internal struct _Options {
        let dateEncodingStrategy: DateEncodingStrategy
        let dataEncodingStrategy: DataEncodingStrategy
        let nonConformingFloatEncodingStrategy: NonConformingFloatEncodingStrategy
        let userInfo: [CodingUserInfoKey : Any]
    }
    
    /// The options set on the top-level encoder.
    internal var options: _Options {
        return _Options(dateEncodingStrategy: dateEncodingStrategy,
                        dataEncodingStrategy: dataEncodingStrategy,
                        nonConformingFloatEncodingStrategy: nonConformingFloatEncodingStrategy,
                        userInfo: userInfo)
    }
    
    // MARK: - Constructing a Base Encoder
    /// Initializes `self` with default strategies.
    /*public init(_ transformation: @escaping TranformationMethod) {
        self._transformation = transformation
    }*/
    public init() { }
    
    // MARK: - Encoding Values
    /// Encodes the given top-level value and returns its Base representation.
    ///
    /// - parameter value: The value to encode.
    /// - returns: A new `Data` value containing the encoded Base data.
    /// - throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
    /// - throws: An error if any value throws an error during encoding.
    /*open func encode<T : Encodable>(_ value: T) throws -> EncodingResults {
        let encoder = _BaseEncoder(options: self.options)
        
        guard var topLevel = try encoder.box_(value) else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) did not encode any values."))
        }
        
        //if topLevel is NSNull {
        if isNil(topLevel) {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) encoded as null \(type(of: self)) fragment."))
        } /*else if topLevel is NSNumber {
         throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) encoded as number \(type(of: self)) fragment."))
         } else if topLevel is NSString {
         throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) encoded as string \(type(of: self)) fragment."))
         } else if topLevel is [Any] {
         throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) encoded as array \(type(of: self)) fragment."))
         }*/
        
        if let box = topLevel as? SCArrayOrderedDictionary<String, Any> { topLevel = encoder.excapeMutableObjects(box) }
        else if let box = topLevel as? SCArray<Any> { topLevel = encoder.excapeMutableObjects(box) }
        
        return try self._transformation(self, topLevel)
        
    }*/
    
    open func box(_ value: Bool)   -> Any? { return nil }
    open func box(_ value: Int)    -> Any? { return nil }
    open func box(_ value: Int8)   -> Any? { return nil }
    open func box(_ value: Int16)  -> Any? { return nil }
    open func box(_ value: Int32)  -> Any? { return nil }
    open func box(_ value: Int64)  -> Any? { return nil }
    open func box(_ value: UInt)   -> Any? { return nil }
    open func box(_ value: UInt8)  -> Any? { return nil }
    open func box(_ value: UInt16) -> Any? { return nil }
    open func box(_ value: UInt32) -> Any? { return nil }
    open func box(_ value: UInt64) -> Any? { return nil }
    open func box(_ value: String) -> Any? { return nil }
    open func box(_ float: Float) throws -> Any? { return nil }
    open func box(_ double: Double) throws -> Any? {return nil }
    open func box(_ date: Date) throws -> Any? {return nil }
    open func box(_ data: Data) throws -> Any? {return nil }
    
    
    
    // MARK: - _BaseEncoder
    internal class _BaseEncoder : Encoder {
        // MARK: Properties
        fileprivate let baseEncoder: BaseEncoder
        /// The encoder's storage.
        internal var storage: _BaseEncodingStorage
        
        /// Options set on the top-level encoder.
        internal let options: BaseEncoder._Options
        
        /// The path to the current point in encoding.
        public var codingPath: [CodingKey]
        
        /// Contextual user-provided information for use during encoding.
        public var userInfo: [CodingUserInfoKey : Any] {
            return self.options.userInfo
        }
        
        // MARK: - Initialization
        /// Initializes `self` with the given top-level encoder options.
        internal init(_ baseEncoder: BaseEncoder, options: BaseEncoder._Options, codingPath: [CodingKey] = []) {
            self.baseEncoder = baseEncoder
            self.options = options
            self.storage = _BaseEncodingStorage()
            self.codingPath = codingPath
        }
        
        /// Returns whether a new element can be encoded at this coding path.
        ///
        /// `true` if an element has not yet been encoded at this coding path; `false` otherwise.
        fileprivate var canEncodeNewValue: Bool {
            // Every time a new value gets encoded, the key it's encoded for is pushed onto the coding path (even if it's a nil key from an unkeyed container).
            // At the same time, every time a container is requested, a new value gets pushed onto the storage stack.
            // If there are more values on the storage stack than on the coding path, it means the value is requesting more than one container, which violates the precondition.
            //
            // This means that anytime something that can request a new container goes onto the stack, we MUST push a key onto the coding path.
            // Things which will not request containers do not need to have the coding path extended for them (but it doesn't matter if it is, because they will not reach here).
            return self.storage.count == self.codingPath.count
        }
        
        // MARK: - Encoder Methods
        public func container<Key>(keyedBy: Key.Type) -> KeyedEncodingContainer<Key> {
            // If an existing keyed container was already requested, return that one.
            let topContainer: SCArrayOrderedDictionary<String, Any>
            if self.canEncodeNewValue {
                // We haven't yet pushed a container at this level; do so here.
                topContainer = self.storage.pushKeyedContainer()
            } else {
                guard let container = self.storage.containers.last as? SCArrayOrderedDictionary<String, Any> else {
                    preconditionFailure("Attempt to push new keyed encoding container when already previously encoded at this path.")
                }
                
                topContainer = container
            }
            
            let container = _BaseKeyedEncodingContainer<Key>(referencing: self, codingPath: self.codingPath, wrapping: topContainer)
            return KeyedEncodingContainer(container)
        }
        
        public func unkeyedContainer() -> UnkeyedEncodingContainer {
            // If an existing unkeyed container was already requested, return that one.
            let topContainer: SCArray<Any>
            if self.canEncodeNewValue {
                // We haven't yet pushed a container at this level; do so here.
                topContainer = self.storage.pushUnkeyedContainer()
            } else {
                guard let container = self.storage.containers.last as? SCArray<Any> else {
                    preconditionFailure("Attempt to push new unkeyed encoding container when already previously encoded at this path.")
                }
                
                topContainer = container
            }
            
            return _BaseUnkeyedEncodingContainer(referencing: self, codingPath: self.codingPath, wrapping: topContainer)
        }
        
        public func singleValueContainer() -> SingleValueEncodingContainer {
            return self
        }
    }
    
    // MARK: - Encoding Storage and Containers
    internal struct _BaseEncodingStorage {
        // MARK: Properties
        /// The container stack.
        private(set) fileprivate var containers: [Any] = []
        
        // MARK: - Initialization
        /// Initializes `self` with no containers.
        fileprivate init() {}
        
        // MARK: - Modifying the Stack
        fileprivate var count: Int {
            return self.containers.count
        }
        
        fileprivate mutating func pushKeyedContainer() -> SCArrayOrderedDictionary<String, Any> {
            let dictionary = SCArrayOrderedDictionary<String, Any>()
            self.containers.append(dictionary)
            return dictionary
        }
        
        fileprivate mutating func pushUnkeyedContainer() -> SCArray<Any> {
            let array = SCArray<Any>()
            self.containers.append(array)
            return array
        }
        
        fileprivate mutating func push(container: Any) {
            self.containers.append(container)
        }
        
        fileprivate mutating func popContainer() -> Any {
            precondition(!self.containers.isEmpty, "Empty container stack.")
            return self.containers.popLast()!
        }
    }
    
    // MARK: - Encoding Containers
    fileprivate struct _BaseKeyedEncodingContainer<K : CodingKey> : KeyedEncodingContainerProtocol {
        typealias Key = K
        
        // MARK: Properties
        /// A reference to the encoder we're writing to.
        private let encoder: _BaseEncoder
        
        /// A reference to the container we're writing to.
        private let container: SCArrayOrderedDictionary<String, Any>
        
        /// The path of coding keys taken to get to this point in encoding.
        private(set) public var codingPath: [CodingKey]
        
        // MARK: - Initialization
        /// Initializes `self` with the given references.
        fileprivate init(referencing encoder: _BaseEncoder, codingPath: [CodingKey], wrapping container: SCArrayOrderedDictionary<String, Any>) {
            self.encoder = encoder
            self.codingPath = codingPath
            self.container = container
        }
        
        // MARK: - KeyedEncodingContainerProtocol Methods
        //public mutating func encodeNil(forKey key: Key)               throws { self.container[key.stringValue] = NSNull() }
        public mutating func encodeNil(forKey key: Key)               throws { self.container[key.stringValue] = nil }
        public mutating func encode(_ value: Bool, forKey key: Key)   throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: Int, forKey key: Key)    throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: Int8, forKey key: Key)   throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: Int16, forKey key: Key)  throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: Int32, forKey key: Key)  throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: Int64, forKey key: Key)  throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: UInt, forKey key: Key)   throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: UInt8, forKey key: Key)  throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: UInt16, forKey key: Key) throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: UInt32, forKey key: Key) throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: UInt64, forKey key: Key) throws { self.container[key.stringValue] = self.encoder.box(value) }
        public mutating func encode(_ value: String, forKey key: Key) throws { self.container[key.stringValue] = self.encoder.box(value) }
        
        public mutating func encode(_ value: Float, forKey key: Key)  throws {
            // Since the float may be invalid and throw, the coding path needs to contain this key.
            self.encoder.codingPath.append(key)
            defer { self.encoder.codingPath.removeLast() }
            #if DEPLOYMENT_RUNTIME_SWIFT
            self.container[key.stringValue._bridgeToObjectiveC()] = try self.encoder.box(value)
            #else
            self.container[key.stringValue] = try self.encoder.box(value)
            #endif
        }
        
        public mutating func encode(_ value: Double, forKey key: Key) throws {
            // Since the double may be invalid and throw, the coding path needs to contain this key.
            self.encoder.codingPath.append(key)
            defer { self.encoder.codingPath.removeLast() }
            #if DEPLOYMENT_RUNTIME_SWIFT
            self.container[key.stringValue._bridgeToObjectiveC()] = try self.encoder.box(value)
            #else
            self.container[key.stringValue] = try self.encoder.box(value)
            #endif
        }
        
        public mutating func encode<T : Encodable>(_ value: T, forKey key: Key) throws {
            self.encoder.codingPath.append(key)
            defer { self.encoder.codingPath.removeLast() }
            #if DEPLOYMENT_RUNTIME_SWIFT
            self.container[key.stringValue._bridgeToObjectiveC()] = try self.encoder.box(value)
            #else
            self.container[key.stringValue] = try self.encoder.box(value)
            #endif
        }
        
        public mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> {
            let dictionary = SCArrayOrderedDictionary<String, Any>()
            #if DEPLOYMENT_RUNTIME_SWIFT
            self.container[key.stringValue._bridgeToObjectiveC()] = dictionary
            #else
            self.container[key.stringValue] = dictionary
            #endif
            
            self.codingPath.append(key)
            defer { self.codingPath.removeLast() }
            
            let container = _BaseKeyedEncodingContainer<NestedKey>(referencing: self.encoder, codingPath: self.codingPath, wrapping: dictionary)
            return KeyedEncodingContainer(container)
        }
        
        public mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
            let array = SCArray<Any>()
            #if DEPLOYMENT_RUNTIME_SWIFT
            self.container[key.stringValue._bridgeToObjectiveC()] = array
            #else
            self.container[key.stringValue] = array
            #endif
            
            self.codingPath.append(key)
            defer { self.codingPath.removeLast() }
            return _BaseUnkeyedEncodingContainer(referencing: self.encoder, codingPath: self.codingPath, wrapping: array)
        }
        
        public mutating func superEncoder() -> Encoder {
            return _BaseReferencingEncoder(referencing: self.encoder, at: _BaseKey.super, wrapping: self.container)
        }
        
        public mutating func superEncoder(forKey key: Key) -> Encoder {
            return _BaseReferencingEncoder(referencing: self.encoder, at: key, wrapping: self.container)
        }
    }
    
    fileprivate struct _BaseUnkeyedEncodingContainer : UnkeyedEncodingContainer {
        // MARK: Properties
        /// A reference to the encoder we're writing to.
        private let encoder: _BaseEncoder
        
        /// A reference to the container we're writing to.
        private let container: SCArray<Any>
        
        /// The path of coding keys taken to get to this point in encoding.
        private(set) public var codingPath: [CodingKey]
        
        /// The number of elements encoded into the container.
        public var count: Int {
            return self.container.count
        }
        
        // MARK: - Initialization
        /// Initializes `self` with the given references.
        fileprivate init(referencing encoder: _BaseEncoder, codingPath: [CodingKey], wrapping container: SCArray<Any>) {
            self.encoder = encoder
            self.codingPath = codingPath
            self.container = container
        }
        
        // MARK: - UnkeyedEncodingContainer Methods
        //public mutating func encodeNil()             throws { self.container.add(NSNull()) }
        public mutating func encodeNil()             throws { self.container.add(AnyNil) }
        public mutating func encode(_ value: Bool)   throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: Int)    throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: Int8)   throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: Int16)  throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: Int32)  throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: Int64)  throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: UInt)   throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: UInt8)  throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: UInt16) throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: UInt32) throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: UInt64) throws { self.container.add(self.encoder.box(value)) }
        public mutating func encode(_ value: String) throws { self.container.add(self.encoder.box(value)) }
        
        public mutating func encode(_ value: Float)  throws {
            // Since the float may be invalid and throw, the coding path needs to contain this key.
            self.encoder.codingPath.append(_BaseKey(index: self.count))
            defer { self.encoder.codingPath.removeLast() }
            self.container.add(try self.encoder.box(value))
        }
        
        public mutating func encode(_ value: Double) throws {
            // Since the double may be invalid and throw, the coding path needs to contain this key.
            self.encoder.codingPath.append(_BaseKey(index: self.count))
            defer { self.encoder.codingPath.removeLast() }
            self.container.add(try self.encoder.box(value))
        }
        
        public mutating func encode<T : Encodable>(_ value: T) throws {
            self.encoder.codingPath.append(_BaseKey(index: self.count))
            defer { self.encoder.codingPath.removeLast() }
            self.container.add(try self.encoder.box(value))
        }
        
        public mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> {
            self.codingPath.append(_BaseKey(index: self.count))
            defer { self.codingPath.removeLast() }
            
            let dictionary = SCArrayOrderedDictionary<String, Any>()
            self.container.add(dictionary)
            
            let container = _BaseKeyedEncodingContainer<NestedKey>(referencing: self.encoder, codingPath: self.codingPath, wrapping: dictionary)
            return KeyedEncodingContainer(container)
        }
        
        public mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
            self.codingPath.append(_BaseKey(index: self.count))
            defer { self.codingPath.removeLast() }
            
            let array = SCArray<Any>()
            self.container.add(array)
            return _BaseUnkeyedEncodingContainer(referencing: self.encoder, codingPath: self.codingPath, wrapping: array)
        }
        
        public mutating func superEncoder() -> Encoder {
            return _BaseReferencingEncoder(referencing: self.encoder, at: self.container.count, wrapping: self.container)
        }
    }
    
    // MARK: - _BaseReferencingEncoder
    /// _BaseReferencingEncoder is a special subclass of _BaseEncoder which has its own storage, but references the contents of a different encoder.
    /// It's used in superEncoder(), which returns a new encoder for encoding a superclass -- the lifetime of the encoder should not escape the scope it's created in, but it doesn't necessarily know when it's done being used (to write to the original container).
    fileprivate class _BaseReferencingEncoder : _BaseEncoder {
        // MARK: Reference types.
        /// The type of container we're referencing.
        private enum Reference {
            /// Referencing a specific index in an array container.
            case array(SCArray<Any>, Int)
            
            /// Referencing a specific key in a dictionary container.
            case dictionary(SCArrayOrderedDictionary<String, Any>, String)
        }
        
        // MARK: - Properties
        /// The encoder we're referencing.
        fileprivate let encoder: _BaseEncoder
        
        /// The container reference itself.
        private let reference: Reference
        
        // MARK: - Initialization
        /// Initializes `self` by referencing the given array container in the given encoder.
        fileprivate init(referencing encoder: _BaseEncoder,
                         at index: Int,
                         wrapping array: SCArray<Any>) {
            self.encoder = encoder
            self.reference = .array(array, index)
            super.init(encoder.baseEncoder, options: encoder.options, codingPath: encoder.codingPath)
            
            self.codingPath.append(_BaseKey(index: index))
        }
        
        /// Initializes `self` by referencing the given dictionary container in the given encoder.
        fileprivate init(referencing encoder: _BaseEncoder,
                         at key: CodingKey,
                         wrapping dictionary: SCArrayOrderedDictionary<String, Any>) {
            self.encoder = encoder
            self.reference = .dictionary(dictionary, key.stringValue)
            super.init(encoder.baseEncoder, options: encoder.options, codingPath: encoder.codingPath)
            
            self.codingPath.append(key)
        }
        
        // MARK: - Coding Path Operations
        fileprivate override var canEncodeNewValue: Bool {
            // With a regular encoder, the storage and coding path grow together.
            // A referencing encoder, however, inherits its parents coding path, as well as the key it was created for.
            // We have to take this into account.
            return self.storage.count == self.codingPath.count - self.encoder.codingPath.count - 1
        }
        
        // MARK: - Deinitialization
        // Finalizes `self` by writing the contents of our storage to the referenced encoder's storage.
        deinit {
            let value: Any
            switch self.storage.count {
            case 0: value = Dictionary<String, Any>()
            case 1: value = self.storage.popContainer()
            default: fatalError("Referencing encoder deallocated with multiple containers on stack.")
            }
            
            switch self.reference {
            case .array(let array, let index):
                array.insert(value, at: index)
                
            case .dictionary(let dictionary, let key):
                dictionary[key] = value
            }
        }
    }
}

extension BaseEncoder._BaseEncoder : SingleValueEncodingContainer {
    // MARK: - SingleValueEncodingContainer Methods
    fileprivate func assertCanEncodeNewValue() {
        precondition(self.canEncodeNewValue, "Attempt to encode value through single value container when previously value already encoded.")
    }
    
    public func encodeNil() throws {
        assertCanEncodeNewValue()
        //self.storage.push(container: NSNull())
        self.storage.push(container: AnyNil)
    }
    
    public func encode(_ value: Bool) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Int) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Int8) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Int16) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Int32) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Int64) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: UInt) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: UInt8) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: UInt16) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: UInt32) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: UInt64) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: String) throws {
        assertCanEncodeNewValue()
        self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Float) throws {
        assertCanEncodeNewValue()
        try self.storage.push(container: self.box(value))
    }
    
    public func encode(_ value: Double) throws {
        assertCanEncodeNewValue()
        try self.storage.push(container: self.box(value))
    }
    
    public func encode<T : Encodable>(_ value: T) throws {
        assertCanEncodeNewValue()
        try self.storage.push(container: self.box(value))
    }
}

// MARK: - Concrete Value Representations
extension BaseEncoder._BaseEncoder {
    /// Returns the given value boxed in a container appropriate for pushing onto the container stack.
    fileprivate func box(_ value: Bool)   -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: Int)    -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: Int8)   -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: Int16)  -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: Int32)  -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: Int64)  -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: UInt)   -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: UInt8)  -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: UInt16) -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: UInt32) -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: UInt64) -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return NSNumber(value: value) }
    }
    fileprivate func box(_ value: String) -> Any {
        if let v = self.baseEncoder.box(value) { return v }
        else { return value }
    }
    
    fileprivate func box(_ float: Float) throws -> Any {
        guard !float.isInfinite && !float.isNaN else {
            guard case let .convertToString(positiveInfinity: posInfString,
                                            negativeInfinity: negInfString,
                                            nan: nanString) = self.options.nonConformingFloatEncodingStrategy else {
                                                throw EncodingError._invalidFloatingPointValue(float, at: codingPath)
            }
            
            if float == Float.infinity {
                return posInfString
            } else if float == -Float.infinity {
                return negInfString
            } else {
                return nanString
            }
        }
        
        return NSNumber(value: float)
    }
    
    fileprivate func box(_ double: Double) throws -> Any {
        guard !double.isInfinite && !double.isNaN else {
            guard case let .convertToString(positiveInfinity: posInfString,
                                            negativeInfinity: negInfString,
                                            nan: nanString) = self.options.nonConformingFloatEncodingStrategy else {
                                                throw EncodingError._invalidFloatingPointValue(double, at: codingPath)
            }
            
            if double == Double.infinity {
                return posInfString
            } else if double == -Double.infinity {
                return negInfString
            } else {
                return nanString
            }
        }
        
        return NSNumber(value: double)
    }
    
    fileprivate func box(_ date: Date) throws -> Any {
        switch self.options.dateEncodingStrategy {
        case .deferredToDate:
            // Must be called with a surrounding with(pushedKey:) call.
            // Dates encode as single-value objects; this can't both throw and push a container, so no need to catch the error.
            try date.encode(to: self)
            return self.storage.popContainer()
            
        case .secondsSince1970:
            return NSNumber(value: date.timeIntervalSince1970)
            
        case .millisecondsSince1970:
            return NSNumber(value: 1000.0 * date.timeIntervalSince1970)
            
        case .iso8601:
            if #available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                return _iso8601Formatter.string(from: date)
            } else {
                fatalError("ISO8601DateFormatter is unavailable on this platform.")
            }
            
        case .formatted(let formatter):
            return formatter.string(from: date)
            
        case .custom(let closure):
            let depth = self.storage.count
            do {
                try closure(date, self)
            } catch {
                // If the value pushed a container before throwing, pop it back off to restore state.
                if self.storage.count > depth {
                    let _ = self.storage.popContainer()
                }
                throw error
            }
            
            guard self.storage.count > depth else {
                // The closure didn't encode anything. Return the default keyed container.
                return Dictionary<String, Any>()
            }
            
            // We can pop because the closure encoded something.
            return self.storage.popContainer()
        }
    }
    
    fileprivate func box(_ data: Data) throws -> Any {
        switch self.options.dataEncodingStrategy {
        case .deferredToData:
            // Must be called with a surrounding with(pushedKey:) call.
            let depth = self.storage.count
            do {
                try data.encode(to: self)
            } catch {
                // If the value pushed a container before throwing, pop it back off to restore state.
                // This shouldn't be possible for Data (which encodes as an array of bytes), but it can't hurt to catch a failure.
                if self.storage.count > depth {
                    let _ = self.storage.popContainer()
                }
                throw error
            }
            return self.storage.popContainer()
            
        case .base64:
            return data.base64EncodedString()
            
        case .custom(let closure):
            let depth = self.storage.count
            do {
                try closure(data, self)
            } catch {
                // If the value pushed a container before throwing, pop it back off to restore state.
                if self.storage.count > depth {
                    let _ = self.storage.popContainer()
                }
                throw error
            }
            
            guard self.storage.count > depth else {
                // The closure didn't encode anything. Return the default keyed container.
                return Dictionary<String, Any>()
            }
            // We can pop because the closure encoded something.
            return self.storage.popContainer()
        }
    }
    
    internal func box<T : Encodable>(_ value: T) throws -> Any {
        return try self.box_(value) ?? Dictionary<String, Any>()
    }
    
    // This method is called "box_" instead of "box" to disambiguate it from the overloads. Because the return type here is different from all of the "box" overloads (and is more general), any "box" calls in here would call back into "box" recursively instead of calling the appropriate overload, which is not what we want.
    internal func box_<T : Encodable>(_ value: T) throws -> Any? {
        #if DEPLOYMENT_RUNTIME_SWIFT
        if T.self == Date.self {
            // Respect Date encoding strategy
            return try self.box((value as! Date))
        } else if T.self == Data.self {
            // Respect Data encoding strategy
            return try self.box((value as! Data))
        } else if T.self == URL.self {
            // Encode URLs as single strings.
            return self.box((value as! URL).absoluteString)
        } else if T.self == Decimal.self {
            // On Darwin we get ((value as! Decimal) as NSDecimalNumber) since BaseSerialization can consume NSDecimalNumber values.
            // FIXME: Attempt to create a Decimal value if BaseSerialization on Linux consume one.
            let doubleValue = (value as! Decimal).doubleValue
            return try self.box(doubleValue)
        }
        
        #else
        if T.self == Date.self || T.self == NSDate.self {
            // Respect Date encoding strategy
            return try self.box((value as! Date))
        } else if T.self == Data.self || T.self == NSData.self {
            // Respect Data encoding strategy
            return try self.box((value as! Data))
        } else if T.self == URL.self || T.self == NSURL.self {
            // Encode URLs as single strings.
            return self.box((value as! URL).absoluteString)
        } else if T.self == Decimal.self {
            // On Darwin we get ((value as! Decimal) as NSDecimalNumber) since BaseSerialization can consume NSDecimalNumber values.
            // FIXME: Attempt to create a Decimal value if BaseSerialization on Linux consume one.
            
            //let doubleValue = (value as! Decimal).doubleValue
            let doubleValue = NSDecimalNumber(decimal: value as! Decimal).doubleValue
            return try self.box(doubleValue)
        }
        #endif
        
        // The value should request a container from the _BaseEncoder.
        let depth = self.storage.count
        do {
            try value.encode(to: self)
        } catch {
            // If the value pushed a container before throwing, pop it back off to restore state.
            if self.storage.count > depth {
                let _ = self.storage.popContainer()
            }
            throw error
        }
        
        // The top container should be a new container.
        guard self.storage.count > depth else {
            return nil
        }
        
        return self.storage.popContainer()
    }
    
    internal func excapeMutableObjects(_ value: Any) -> Any {
        if let ary = value as? SCArray<Any> { return excapeMutableObjects(ary) }
        else if let dict = value as? SCArrayOrderedDictionary<String, Any> { return excapeMutableObjects(dict) }
        else if let v = value as? NSString { return v.substring(from: 0) } //Cheating way to cast from NSString to String
        else if let v = value as? NSDate { return Date(timeIntervalSince1970: v.timeIntervalSince1970) } //Cheating way to cast from NSDate to Date
        else if let v = value as? NSData { return Data(referencing: v) } // Cheating way ot cast from NSData to Data
        else { return value }
    }
    
    internal func excapeMutableObjects(_ value: SCArrayOrderedDictionary<String, Any>) -> Any {
        var rtn: [String: Any] = [:]
        for (k,v) in value {
            var newValue = v
            if let ary = newValue as? SCArray<Any> { newValue = excapeMutableObjects(ary) }
            else if let dict = newValue as? SCArrayOrderedDictionary<String, Any> { newValue = excapeMutableObjects(dict) }
            else { newValue = excapeMutableObjects(newValue) }
            rtn[k] = newValue
        }
        return rtn
    }
    
    internal func excapeMutableObjects(_ value: SCArray<Any>) -> Any {
        var rtn: [Any] = []
        for v in value {
            var newValue = v
            if let ary = newValue as? SCArray<Any> { newValue = excapeMutableObjects(ary) }
            else if let dict = newValue as? SCArrayOrderedDictionary<String, Any> { newValue = excapeMutableObjects(dict) }
            else { newValue = excapeMutableObjects(newValue) }
            rtn.append(newValue)
        }
        return rtn
    }
}


public protocol BaseDecodingStorage {
    
    var count: Int { get }
    var topContainer: Any { get }
    
    mutating func push(container: Any)
    mutating func popContainer()
}

//===----------------------------------------------------------------------===//
// Base Decoder
//===----------------------------------------------------------------------===//
/// `BaseDecoder` facilitates the decoding of Base into semantic `Decodable` types.
open class BaseDecoder {
    
    // MARK: Options
    /// The strategy to use for decoding `Date` values.
    public enum DateDecodingStrategy {
        /// Defer to `Date` for decoding. This is the default strategy.
        case deferredToDate
        
        /// Decode the `Date` as a UNIX timestamp from a Base number.
        case secondsSince1970
        
        /// Decode the `Date` as UNIX millisecond timestamp from a Base number.
        case millisecondsSince1970
        
        /// Decode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
        @available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
        case iso8601
        
        /// Decode the `Date` as a string parsed by the given formatter.
        case formatted(DateFormatter)
        
        /// Decode the `Date` as a custom value decoded by the given closure.
        case custom((_ decoder: Decoder) throws -> Date)
    }
    
    /// The strategy to use for decoding `Data` values.
    public enum DataDecodingStrategy {
        /// Defer to `Data` for decoding.
        case deferredToData
        
        /// Decode the `Data` from a Base64-encoded string. This is the default strategy.
        case base64
        
        /// Decode the `Data` as a custom value decoded by the given closure.
        case custom((_ decoder: Decoder) throws -> Data)
    }
    
    /// The strategy to use for non-Base-conforming floating-point values (IEEE 754 infinity and NaN).
    public enum NonConformingFloatDecodingStrategy {
        /// Throw upon encountering non-conforming values. This is the default strategy.
        case `throw`
        
        /// Decode the values from the given representation strings.
        case convertFromString(positiveInfinity: String, negativeInfinity: String, nan: String)
    }
    
    /// The strategy to use in decoding dates. Defaults to `.deferredToDate`.
    open var dateDecodingStrategy: DateDecodingStrategy = .deferredToDate
    
    /// The strategy to use in decoding binary data. Defaults to `.base64`.
    open var dataDecodingStrategy: DataDecodingStrategy = .base64
    
    /// The strategy to use in decoding non-conforming numbers. Defaults to `.throw`.
    open var nonConformingFloatDecodingStrategy: NonConformingFloatDecodingStrategy = .throw
    
    /// Contextual user-provided information for use during decoding.
    open var userInfo: [CodingUserInfoKey : Any] = [:]
    
    /// Options set on the top-level encoder to pass down the decoding hierarchy.
    internal struct _Options {
        let dateDecodingStrategy: DateDecodingStrategy
        let dataDecodingStrategy: DataDecodingStrategy
        let nonConformingFloatDecodingStrategy: NonConformingFloatDecodingStrategy
        let userInfo: [CodingUserInfoKey : Any]
    }
    
    /// The options set on the top-level decoder.
    internal var options: _Options {
        return _Options(dateDecodingStrategy: dateDecodingStrategy,
                        dataDecodingStrategy: dataDecodingStrategy,
                        nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy,
                        userInfo: userInfo)
    }
    
    // MARK: - Constructing a Base Decoder
    /// Initializes `self` with default strategies.
    /*public init(_ transformation: @escaping TranformationMethod) {
        self._transformation = transformation
    }*/
    public init() { }
    
    // MARK: - Decoding Values
    /// Decodes a top-level value of the given type from the given Base representation.
    ///
    /// - parameter type: The type of the value to decode.
    /// - parameter data: The data to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid Base.
    /// - throws: An error if any value throws an error during decoding.
    /*open func decode<T : Decodable>(_ type: T.Type, from data: DecodingInput) throws -> T {
        let topLevel: Any
        do {
            topLevel = try self._transformation(self, data)
        } catch {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid Base.", underlyingError: error))
        }
        
        let decoder = _BaseDecoder(referencing: topLevel, options: self.options)
        guard let value = try decoder.unbox(topLevel, as: type) else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: [], debugDescription: "The given data did not contain a top-level value."))
        }
        
        return value
    }*/
    
    
    
    /// Returns the given value unboxed from a container.
    open func unbox(_ value: Any, as type: Bool.Type, atPath codingPath: [CodingKey]) throws -> Bool? { return nil }
    open func unbox(_ value: Any, as type: Int.Type, atPath codingPath: [CodingKey]) throws -> Int? { return nil }
    open func unbox(_ value: Any, as type: Int8.Type, atPath codingPath: [CodingKey]) throws -> Int8? { return nil }
    open func unbox(_ value: Any, as type: Int16.Type, atPath codingPath: [CodingKey]) throws -> Int16? { return nil }
    open func unbox(_ value: Any, as type: Int32.Type, atPath codingPath: [CodingKey]) throws -> Int32? { return nil }
    open func unbox(_ value: Any, as type: Int64.Type, atPath codingPath: [CodingKey]) throws -> Int64? { return nil }
    open func unbox(_ value: Any, as type: UInt.Type, atPath codingPath: [CodingKey]) throws -> UInt? { return nil }
    open func unbox(_ value: Any, as type: UInt8.Type, atPath codingPath: [CodingKey]) throws -> UInt8? { return nil }
    open func unbox(_ value: Any, as type: UInt16.Type, atPath codingPath: [CodingKey]) throws -> UInt16? { return nil }
    open func unbox(_ value: Any, as type: UInt32.Type, atPath codingPath: [CodingKey]) throws -> UInt32? { return nil }
    open func unbox(_ value: Any, as type: UInt64.Type, atPath codingPath: [CodingKey]) throws -> UInt64? { return nil }
    open func unbox(_ value: Any, as type: Float.Type, atPath codingPath: [CodingKey]) throws -> Float? { return nil }
    open func unbox(_ value: Any, as type: Double.Type, atPath codingPath: [CodingKey]) throws -> Double? { return nil }
    open func unbox(_ value: Any, as type: String.Type, atPath codingPath: [CodingKey]) throws -> String? { return nil }
    open func unbox(_ value: Any, as type: Date.Type, atPath codingPath: [CodingKey]) throws -> Date? { return nil }
    open func unbox(_ value: Any, as type: Data.Type, atPath codingPath: [CodingKey]) throws -> Data? { return nil }
    open func unbox(_ value: Any, as type: Decimal.Type, atPath codingPath: [CodingKey]) throws -> Decimal? { return nil }
    
    
    // MARK: - _BaseDecoder
    internal class _BaseDecoder : Decoder {
        // MARK: Properties
        fileprivate let baseDecoder: BaseDecoder
        /// The decoder's storage.
        internal var storage: _BaseDecodingStorage
        
        /// Options set on the top-level decoder.
        internal let options: BaseDecoder._Options
        
        /// The path to the current point in encoding.
        internal(set) public var codingPath: [CodingKey]
        
        /// Contextual user-provided information for use during encoding.
        public var userInfo: [CodingUserInfoKey : Any] {
            return self.options.userInfo
        }
        
        // MARK: - Initialization
        /// Initializes `self` with the given top-level container and options.
        internal init(_ baseDecoder: BaseDecoder, referencing container: Any, at codingPath: [CodingKey] = [], options: BaseDecoder._Options) {
            self.baseDecoder = baseDecoder
            self.storage = _BaseDecodingStorage()
            self.storage.push(container: container)
            self.codingPath = codingPath
            self.options = options
        }
        
        // MARK: - Decoder Methods
        public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> {
            //guard !(self.storage.topContainer is NSNull) else {
            guard !isNil(self.storage.topContainer) else {
                throw DecodingError.valueNotFound(KeyedDecodingContainer<Key>.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get keyed decoding container -- found null value instead."))
            }
            
            guard let topContainer = self.storage.topContainer as? [String : Any] else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: [String : Any].self, reality: self.storage.topContainer)
            }
            
            let container = _BaseKeyedDecodingContainer<Key>(referencing: self, wrapping: topContainer)
            return KeyedDecodingContainer(container)
        }
        
        public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
            guard !isNil(self.storage.topContainer) else {
                throw DecodingError.valueNotFound(UnkeyedDecodingContainer.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get unkeyed decoding container -- found null value instead."))
            }
            
            guard let topContainer = self.storage.topContainer as? [Any] else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: [Any].self, reality: self.storage.topContainer)
            }
            
            return _BaseUnkeyedDecodingContainer(referencing: self, wrapping: topContainer)
        }
        
        public func singleValueContainer() throws -> SingleValueDecodingContainer {
            return self
        }
    }
    
    // MARK: - Decoding Storage
    internal struct _BaseDecodingStorage {
        // MARK: Properties
        /// The container stack.
        private(set) fileprivate var containers: [Any] = []
        
        // MARK: - Initialization
        /// Initializes `self` with no containers.
        internal init() {}
        
        // MARK: - Modifying the Stack
        internal var count: Int {
            return self.containers.count
        }
        
        internal var topContainer: Any {
            precondition(!self.containers.isEmpty, "Empty container stack.")
            return self.containers.last!
        }
        
        internal mutating func push(container: Any) {
            self.containers.append(container)
        }
        
        internal mutating func popContainer() {
            precondition(!self.containers.isEmpty, "Empty container stack.")
            self.containers.removeLast()
        }
    }
    
    // MARK: Decoding Containers
    fileprivate struct _BaseKeyedDecodingContainer<K : CodingKey> : KeyedDecodingContainerProtocol {
        typealias Key = K
        
        // MARK: Properties
        /// A reference to the decoder we're reading from.
        private let decoder: _BaseDecoder
        
        /// A reference to the container we're reading from.
        private let container: [String : Any]
        
        /// The path of coding keys taken to get to this point in decoding.
        private(set) public var codingPath: [CodingKey]
        
        // MARK: - Initialization
        /// Initializes `self` by referencing the given decoder and container.
        fileprivate init(referencing decoder: _BaseDecoder, wrapping container: [String : Any]) {
            self.decoder = decoder
            self.container = container
            self.codingPath = decoder.codingPath
        }
        
        // MARK: - KeyedDecodingContainerProtocol Methods
        public var allKeys: [Key] {
            var rtn: [Key] = []
            for uk in self.container.keys {
                if let nk = Key(stringValue: uk) {
                    rtn.append(nk)
                }
            }
            return rtn
            //return self.container.keys.compactMap { Key(stringValue: $0) }
        }
        
        public func contains(_ key: Key) -> Bool {
            return self.container[key.stringValue] != nil
        }
        
        private func _errorDescription(of key: CodingKey) -> String {
            return "\(key) (\"\(key.stringValue)\")"
        }
        
        public func decodeNil(forKey key: Key) throws -> Bool {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            //return entry is NSNull
            return isNil(entry)
        }
        
        public func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Bool.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Int.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Int8.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Int16.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Int32.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Int64.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: UInt.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: UInt8.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: UInt16.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: UInt32.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: UInt64.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Float.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: Double.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode(_ type: String.Type, forKey key: Key) throws -> String {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: String.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func decode<T : Decodable>(_ type: T.Type, forKey key: Key) throws -> T {
            guard let entry = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
            }
            
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = try self.decoder.unbox(entry, as: type) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath.appending(key), debugDescription: "Expected \(type) value but found null instead."))
            }
            
            return value
        }
        
        public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> {
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key,
                                                DecodingError.Context(codingPath: self.codingPath,
                                                                      debugDescription: "Cannot get \(KeyedDecodingContainer<NestedKey>.self) -- no value found for key \(_errorDescription(of: key))"))
            }
            
            guard let dictionary = value as? [String : Any] else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: [String : Any].self, reality: value)
            }
            
            let container = _BaseKeyedDecodingContainer<NestedKey>(referencing: self.decoder, wrapping: dictionary)
            return KeyedDecodingContainer(container)
        }
        
        public func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            guard let value = self.container[key.stringValue] else {
                throw DecodingError.keyNotFound(key,
                                                DecodingError.Context(codingPath: self.codingPath,
                                                                      debugDescription: "Cannot get UnkeyedDecodingContainer -- no value found for key \(_errorDescription(of: key))"))
            }
            
            guard let array = value as? [Any] else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: [Any].self, reality: value)
            }
            
            return _BaseUnkeyedDecodingContainer(referencing: self.decoder, wrapping: array)
        }
        
        private func _superDecoder(forKey key: CodingKey) throws -> Decoder {
            self.decoder.codingPath.append(key)
            defer { self.decoder.codingPath.removeLast() }
            
            //let value: Any = self.container[key.stringValue] ?? NSNull()
            let value: Any = self.container[key.stringValue] ?? AnyNil
            return _BaseDecoder(self.decoder.baseDecoder, referencing: value, at: self.decoder.codingPath.appending(key), options: self.decoder.options)
        }
        
        public func superDecoder() throws -> Decoder {
            return try _superDecoder(forKey: _BaseKey.super)
        }
        
        public func superDecoder(forKey key: Key) throws -> Decoder {
            return try _superDecoder(forKey: key)
        }
    }
    
    fileprivate struct _BaseUnkeyedDecodingContainer : UnkeyedDecodingContainer {
        // MARK: Properties
        /// A reference to the decoder we're reading from.
        private let decoder: _BaseDecoder
        
        /// A reference to the container we're reading from.
        private let container: [Any]
        
        /// The path of coding keys taken to get to this point in decoding.
        private(set) public var codingPath: [CodingKey]
        
        /// The index of the element we're about to decode.
        private(set) public var currentIndex: Int
        
        // MARK: - Initialization
        /// Initializes `self` by referencing the given decoder and container.
        fileprivate init(referencing decoder: _BaseDecoder, wrapping container: [Any]) {
            self.decoder = decoder
            self.container = container
            self.codingPath = decoder.codingPath
            self.currentIndex = 0
        }
        
        // MARK: - UnkeyedDecodingContainer Methods
        public var count: Int? {
            return self.container.count
        }
        
        public var isAtEnd: Bool {
            return self.currentIndex >= self.count!
        }
        
        public mutating func decodeNil() throws -> Bool {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(Any?.self, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            //if self.container[self.currentIndex] is NSNull {
            if isNil(self.container[self.currentIndex]) {
                self.currentIndex += 1
                return true
            } else {
                return false
            }
        }
        
        public mutating func decode(_ type: Bool.Type) throws -> Bool {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Bool.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.decoder.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Int.Type) throws -> Int {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Int.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Int8.Type) throws -> Int8 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Int8.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Int16.Type) throws -> Int16 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Int16.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Int32.Type) throws -> Int32 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Int32.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Int64.Type) throws -> Int64 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Int64.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: UInt.Type) throws -> UInt {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: UInt.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: UInt8.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: UInt16.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: UInt32.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: UInt64.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Float.Type) throws -> Float {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Float.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: Double.Type) throws -> Double {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: Double.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode(_ type: String.Type) throws -> String {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: String.self) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func decode<T : Decodable>(_ type: T.Type) throws -> T {
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
            }
            
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: type) else {
                throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath + [_BaseKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
            }
            
            self.currentIndex += 1
            return decoded
        }
        
        public mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> {
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(KeyedDecodingContainer<NestedKey>.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get nested keyed container -- unkeyed container is at end."))
            }
            
            let value = self.container[self.currentIndex]
            //guard !(value is NSNull) else {
            guard !isNil(value) else {
                throw DecodingError.valueNotFound(KeyedDecodingContainer<NestedKey>.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get keyed decoding container -- found null value instead."))
            }
            
            guard let dictionary = value as? [String : Any] else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: [String : Any].self, reality: value)
            }
            
            self.currentIndex += 1
            let container = _BaseKeyedDecodingContainer<NestedKey>(referencing: self.decoder, wrapping: dictionary)
            return KeyedDecodingContainer(container)
        }
        
        public mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(UnkeyedDecodingContainer.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get nested keyed container -- unkeyed container is at end."))
            }
            
            let value = self.container[self.currentIndex]
            //guard !(value is NSNull) else {
            guard !isNil(value) else {
                throw DecodingError.valueNotFound(UnkeyedDecodingContainer.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get keyed decoding container -- found null value instead."))
            }
            
            guard let array = value as? [Any] else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: [Any].self, reality: value)
            }
            
            self.currentIndex += 1
            return _BaseUnkeyedDecodingContainer(referencing: self.decoder, wrapping: array)
        }
        
        public mutating func superDecoder() throws -> Decoder {
            self.decoder.codingPath.append(_BaseKey(index: self.currentIndex))
            defer { self.decoder.codingPath.removeLast() }
            
            guard !self.isAtEnd else {
                throw DecodingError.valueNotFound(Decoder.self,
                                                  DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Cannot get superDecoder() -- unkeyed container is at end."))
            }
            
            let value = self.container[self.currentIndex]
            self.currentIndex += 1
            return _BaseDecoder(self.decoder.baseDecoder, referencing: value, at: self.decoder.codingPath, options: self.decoder.options)
        }
    }
}

extension BaseDecoder._BaseDecoder : SingleValueDecodingContainer {
    // MARK: SingleValueDecodingContainer Methods
    private func expectNonNull<T>(_ type: T.Type) throws {
        guard !self.decodeNil() else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.codingPath, debugDescription: "Expected \(type) but found null value instead."))
        }
    }
    
    public func decodeNil() -> Bool {
        //return self.storage.topContainer is NSNull
        return isNil(self.storage.topContainer)
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        try expectNonNull(Bool.self)
        return try self.unbox(self.storage.topContainer, as: Bool.self)!
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        try expectNonNull(Int.self)
        return try self.unbox(self.storage.topContainer, as: Int.self)!
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        try expectNonNull(Int8.self)
        return try self.unbox(self.storage.topContainer, as: Int8.self)!
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        try expectNonNull(Int16.self)
        return try self.unbox(self.storage.topContainer, as: Int16.self)!
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        try expectNonNull(Int32.self)
        return try self.unbox(self.storage.topContainer, as: Int32.self)!
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        try expectNonNull(Int64.self)
        return try self.unbox(self.storage.topContainer, as: Int64.self)!
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        try expectNonNull(UInt.self)
        return try self.unbox(self.storage.topContainer, as: UInt.self)!
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        try expectNonNull(UInt8.self)
        return try self.unbox(self.storage.topContainer, as: UInt8.self)!
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        try expectNonNull(UInt16.self)
        return try self.unbox(self.storage.topContainer, as: UInt16.self)!
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        try expectNonNull(UInt32.self)
        return try self.unbox(self.storage.topContainer, as: UInt32.self)!
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        try expectNonNull(UInt64.self)
        return try self.unbox(self.storage.topContainer, as: UInt64.self)!
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        try expectNonNull(Float.self)
        return try self.unbox(self.storage.topContainer, as: Float.self)!
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        try expectNonNull(Double.self)
        return try self.unbox(self.storage.topContainer, as: Double.self)!
    }
    
    public func decode(_ type: String.Type) throws -> String {
        try expectNonNull(String.self)
        return try self.unbox(self.storage.topContainer, as: String.self)!
    }
    
    public func decode<T : Decodable>(_ type: T.Type) throws -> T {
        try expectNonNull(type)
        return try self.unbox(self.storage.topContainer, as: type)!
    }
}

// MARK: - Concrete Value Representations
extension BaseDecoder._BaseDecoder {
    
    private func store(_ value: Any) -> Any {
        return value
        /*if let val = value as? Commentable<Commentable<String>>  {
         if let v = Bool(val.object.object) { return NSNumber(booleanLiteral: v) }
         else if let v = UInt(val.object.object) { return NSNumber(value: v) }
         else if let v = Int(val.object.object) { return NSNumber(value: v) }
         else if let v = Double(val.object.object) { return NSNumber(value: v) }
         else if let v = Float(val.object.object) { return NSNumber(value: v) }
         else { return val.object.object }
         } else {
         return value
         }
         asdfadsf*/
    }
    /// Returns the given value unboxed from a container.
    internal func unbox(_ value: Any, as type: Bool.Type) throws -> Bool? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Bool.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        #if DEPLOYMENT_RUNTIME_SWIFT
        // Bridging differences require us to split implementations here
        guard let number = store(value) as? NSNumber else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        // TODO: Add a flag to coerce non-boolean numbers into Bools?
        guard number._cfTypeID == CFBooleanGetTypeID() else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        return number.boolValue
        #else
        if let number = value as? NSNumber {
            // TODO: Add a flag to coerce non-boolean numbers into Bools?
            if number === kCFBooleanTrue /*as NSNumber*/ {
                return true
            } else if number === kCFBooleanFalse /*as NSNumber*/ {
                return false
            }
            
            /* FIXME: If swift-corelibs-foundation doesn't change to use NSNumber, this code path will need to be included and tested:
             } else if let bool = value as? Bool {
             return bool
             */
            
        }
        
        throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        #endif
    }
    
    internal func unbox(_ value: Any, as type: Int.Type) throws -> Int? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Int.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let int = number.intValue
        guard NSNumber(value: int) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return int
    }
    
    internal func unbox(_ value: Any, as type: Int8.Type) throws -> Int8? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Int8.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let int8 = number.int8Value
        guard NSNumber(value: int8) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return int8
    }
    
    internal func unbox(_ value: Any, as type: Int16.Type) throws -> Int16? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Int16.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let int16 = number.int16Value
        guard NSNumber(value: int16) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return int16
    }
    
    internal func unbox(_ value: Any, as type: Int32.Type) throws -> Int32? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Int32.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let int32 = number.int32Value
        guard NSNumber(value: int32) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return int32
    }
    
    internal func unbox(_ value: Any, as type: Int64.Type) throws -> Int64? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Int64.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let int64 = number.int64Value
        guard NSNumber(value: int64) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return int64
    }
    
    internal func unbox(_ value: Any, as type: UInt.Type) throws -> UInt? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: UInt.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let uint = number.uintValue
        guard NSNumber(value: uint) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return uint
    }
    
    internal func unbox(_ value: Any, as type: UInt8.Type) throws -> UInt8? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: UInt8.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let uint8 = number.uint8Value
        guard NSNumber(value: uint8) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return uint8
    }
    
    internal func unbox(_ value: Any, as type: UInt16.Type) throws -> UInt16? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: UInt16.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let uint16 = number.uint16Value
        guard NSNumber(value: uint16) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return uint16
    }
    
    internal func unbox(_ value: Any, as type: UInt32.Type) throws -> UInt32? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: UInt32.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let uint32 = number.uint32Value
        guard NSNumber(value: uint32) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return uint32
    }
    
    internal func unbox(_ value: Any, as type: UInt64.Type) throws -> UInt64? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: UInt64.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        guard let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            //guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        let uint64 = number.uint64Value
        guard NSNumber(value: uint64) == number else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number <\(number)> does not fit in \(type)."))
        }
        
        return uint64
    }
    
    internal func unbox(_ value: Any, as type: Float.Type) throws -> Float? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Float.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        if let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse {
            //if let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse {
            // We are willing to return a Float by losing precision:
            // * If the original value was integral,
            //   * and the integral value was > Float.greatestFiniteMagnitude, we will fail
            //   * and the integral value was <= Float.greatestFiniteMagnitude, we are willing to lose precision past 2^24
            // * If it was a Float, you will get back the precise value
            // * If it was a Double or Decimal, you will get back the nearest approximation if it will fit
            let double = number.doubleValue
            guard abs(double) <= Double(Float.greatestFiniteMagnitude) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed Base number \(number) does not fit in \(type)."))
            }
            
            return Float(double)
            
            /* FIXME: If swift-corelibs-foundation doesn't change to use NSNumber, this code path will need to be included and tested:
             } else if let double = value as? Double {
             if abs(double) <= Double(Float.max) {
             return Float(double)
             }
             overflow = true
             } else if let int = value as? Int {
             if let float = Float(exactly: int) {
             return float
             }
             overflow = true
             */
            
        } else if let string = value as? String,
            case .convertFromString(let posInfString, let negInfString, let nanString) = self.options.nonConformingFloatDecodingStrategy {
            if string == posInfString {
                return Float.infinity
            } else if string == negInfString {
                return -Float.infinity
            } else if string == nanString {
                return Float.nan
            }
        }
        
        throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
    }
    
    internal func unbox(_ value: Any, as type: Double.Type) throws -> Double? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Double.self, atPath: self.codingPath) { value = NSNumber(value: v) }
        
        if let number = store(value) as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse {
            //if let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse {
            // We are always willing to return the number as a Double:
            // * If the original value was integral, it is guaranteed to fit in a Double; we are willing to lose precision past 2^53 if you encoded a UInt64 but requested a Double
            // * If it was a Float or Double, you will get back the precise value
            // * If it was Decimal, you will get back the nearest approximation
            return number.doubleValue
            
            /* FIXME: If swift-corelibs-foundation doesn't change to use NSNumber, this code path will need to be included and tested:
             } else if let double = value as? Double {
             return double
             } else if let int = value as? Int {
             if let double = Double(exactly: int) {
             return double
             }
             overflow = true
             */
            
        } else if let string = value as? String,
            case .convertFromString(let posInfString, let negInfString, let nanString) = self.options.nonConformingFloatDecodingStrategy {
            if string == posInfString {
                return Double.infinity
            } else if string == negInfString {
                return -Double.infinity
            } else if string == nanString {
                return Double.nan
            }
        }
        
        throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
    }
    
    internal func unbox(_ value: Any, as type: String.Type) throws -> String? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: String.self, atPath: self.codingPath) { value = v }
        
        guard let string = value as? String else {
            throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
        }
        
        return string
    }
    
    internal func unbox(_ value: Any, as type: Date.Type) throws -> Date? {
        guard !(value is NSNull) else { return nil }
        
        switch self.options.dateDecodingStrategy {
        case .deferredToDate:
            self.storage.push(container: value)
            defer { self.storage.popContainer() }
            return try Date(from: self)
            
        case .secondsSince1970:
            let double = try self.unbox(value, as: Double.self)!
            return Date(timeIntervalSince1970: double)
            
        case .millisecondsSince1970:
            let double = try self.unbox(value, as: Double.self)!
            return Date(timeIntervalSince1970: double / 1000.0)
            
        case .iso8601:
            if #available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                let string = try self.unbox(value, as: String.self)!
                guard let date = _iso8601Formatter.date(from: string) else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Expected date string to be ISO8601-formatted."))
                }
                
                return date
            } else {
                fatalError("ISO8601DateFormatter is unavailable on this platform.")
            }
            
        case .formatted(let formatter):
            let string = try self.unbox(value, as: String.self)!
            guard let date = formatter.date(from: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Date string does not match format expected by formatter."))
            }
            
            return date
            
        case .custom(let closure):
            self.storage.push(container: value)
            defer { self.storage.popContainer() }
            return try closure(self)
        }
    }
    
    internal func unbox(_ value: Any, as type: Data.Type) throws -> Data? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        switch self.options.dataDecodingStrategy {
        case .deferredToData:
            self.storage.push(container: value)
            defer { self.storage.popContainer() }
            return try Data(from: self)
            
        case .base64:
            guard let string = value as? String else {
                throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
            }
            
            guard let data = Data(base64Encoded: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Encountered Data is not valid Base64."))
            }
            
            return data
            
        case .custom(let closure):
            self.storage.push(container: value)
            defer { self.storage.popContainer() }
            return try closure(self)
        }
    }
    
    internal func unbox(_ value: Any, as type: Decimal.Type) throws -> Decimal? {
        //guard !(value is NSNull) else { return nil }
        guard !isNil(value) else { return nil }
        
        var value = value
        if let v = try self.baseDecoder.unbox(value, as: Decimal.self, atPath: self.codingPath) { value = v }
        
        #if DEPLOYMENT_RUNTIME_SWIFT
        // Bridging differences require us to split implementations here
        // On Darwin we get (value as? Decimal) since BaseSerialization can produce NSDecimalNumber values.
        // FIXME: Attempt to grab a Decimal value if BaseSerialization on Linux produces one.
        let doubleValue = try self.unbox(value, as: Double.self)!
        return Decimal(doubleValue)
        #else
        // Attempt to bridge from NSDecimalNumber.
        if let decimal = value as? Decimal {
            return decimal
        } else {
            let doubleValue = try self.unbox(value, as: Double.self)!
            return Decimal(doubleValue)
        }
        #endif
    }
    
    internal func unbox<T : Decodable>(_ value: Any, as type: T.Type) throws -> T? {
        //let decoded: T
        #if DEPLOYMENT_RUNTIME_SWIFT
        // Bridging differences require us to split implementations here
        if T.self == Date.self {
            guard let date = try self.unbox(value, as: Date.self) else { return nil }
            //decoded = date as! T
            return date as! T
        } else if T.self == Data.self {
            guard let data = try self.unbox(value, as: Data.self) else { return nil }
            //decoded = data as! T
            return data as! T
        } else if T.self == URL.self {
            guard let urlString = try self.unbox(value, as: String.self) else {
                return nil
            }
            
            guard let url = URL(string: urlString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Invalid URL string."))
            }
            //decoded = (url as! T)
            return (url as! T)
        } else if T.self == Decimal.self {
            guard let decimal = try self.unbox(value, as: Decimal.self) else { return nil }
            //decoded = decimal as! T
            return decimal as! T
        } else {
            self.storage.push(container: value)
            defer { self.storage.popContainer() }
            return try type.init(from: self)
        }
        #else
        if type == Date.self || type == NSDate.self {
            return try self.unbox(value, as: Date.self) as? T
        } else if type == Data.self || type == NSData.self {
            return try self.unbox(value, as: Data.self) as? T
        } else if type == URL.self || type == NSURL.self {
            guard let urlString = try self.unbox(value, as: String.self) else {
                return nil
            }
            
            guard let url = URL(string: urlString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath,
                                                                        debugDescription: "Invalid URL string."))
            }
            
            return (url as! T)
        } else if type == Decimal.self || type == NSDecimalNumber.self {
            return try self.unbox(value, as: Decimal.self) as? T
        } else {
            self.storage.push(container: value)
            defer { self.storage.popContainer() }
            return try type.init(from: self)
        }
        #endif
        
        //return decoded
    }
}

//===----------------------------------------------------------------------===//
// Shared Key Types
//===----------------------------------------------------------------------===//
fileprivate struct _BaseKey : CodingKey {
    public var stringValue: String
    public var intValue: Int?
    
    public init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    public init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    public init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }
    fileprivate init(index: Int) {
        self.stringValue = "Index \(index)"
        self.intValue = index
    }
    
    fileprivate static let `super` = _BaseKey(stringValue: "super")!
}


//===----------------------------------------------------------------------===//
// Shared ISO8601 Date Formatter
//===----------------------------------------------------------------------===//
// NOTE: This value is implicitly lazy and _must_ be lazy. We're compiled against the latest SDK (w/ ISO8601DateFormatter), but linked against whichever Foundation the user has. ISO8601DateFormatter might not exist, so we better not hit this code path on an older OS.
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
fileprivate var _iso8601Formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()

//===----------------------------------------------------------------------===//
// Error Utilities
//===----------------------------------------------------------------------===//
extension EncodingError {
    /// Returns a `.invalidValue` error describing the given invalid floating-point value.
    ///
    ///
    /// - parameter value: The value that was invalid to encode.
    /// - parameter path: The path of `CodingKey`s taken to encode this value.
    /// - returns: An `EncodingError` with the appropriate path and debug description.
    fileprivate static func _invalidFloatingPointValue<T : FloatingPoint>(_ value: T, at codingPath: [CodingKey]) -> EncodingError {
        let valueDescription: String
        if value == T.infinity {
            valueDescription = "\(T.self).infinity"
        } else if value == -T.infinity {
            valueDescription = "-\(T.self).infinity"
        } else {
            valueDescription = "\(T.self).nan"
        }
        
        let debugDescription = "Unable to encode \(valueDescription) directly in Base. Use BaseEncoder.NonConformingFloatEncodingStrategy.convertToString to specify how the value should be encoded."
        return .invalidValue(value, EncodingError.Context(codingPath: codingPath, debugDescription: debugDescription))
    }
}
