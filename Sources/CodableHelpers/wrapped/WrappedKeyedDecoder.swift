//
//  WrappedKeyedDecoder.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-05.
//

import Foundation

/// A decoder that wraps a keyed decoding container.
///
/// Unsupported functions: unkeyedContainer, singleValueContainer
public class WrappedKeyedDecoder<K>: Decoder where K: CodingKey {
    
    public var userInfo: [CodingUserInfoKey : Any] = [:]
    internal var container: KeyedDecodingContainer<K>
   
    public let codingPath: [CodingKey]
    public init(_ container: KeyedDecodingContainer<K>) {
        self.container = container
        self.codingPath = container.codingPath
    }
    
    public init<Container>(_ container: Container) where K == Container.Key, Container : KeyedDecodingContainerProtocol {
        self.container = KeyedDecodingContainer<K>(container)
        self.codingPath = container.codingPath
    }
    
    public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        let rtn = BridgedKeyedDecodingContainer<K, Key>(self.container)
        return KeyedDecodingContainer<Key>(rtn)
    }
    
    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError("Unsupported method")
    }
    
    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        fatalError("Unsupported method")
    }
}

/// A decoder that wraps a keyed decoding container.
///
/// Unsupported functions: unkeyedContainer, singleValueContainer
public class WrappedPreKeyedDecoder<K>: Decoder where K: CodingKey {
    public var userInfo: [CodingUserInfoKey : Any] = [:]
    internal var container: KeyedDecodingContainer<K>
    private let preKey: K
    // public var codingPath: [CodingKey] { return self.container.codingPath }
    public let codingPath: [CodingKey]
    public init(_ container: KeyedDecodingContainer<K>, preKey: K) {
        self.container = container
        self.preKey = preKey
        self.codingPath = container.codingPath
    }
    
    public init<Container>(_ container: Container, preKey: K) where K == Container.Key, Container : KeyedDecodingContainerProtocol {
        self.container = KeyedDecodingContainer<K>(container)
        self.preKey = preKey
        self.codingPath = container.codingPath
    }
    
    public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        return try self.container.nestedContainer(keyedBy: type, forKey: self.preKey)
    }
    
    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return try self.container.nestedUnkeyedContainer(forKey: self.preKey)
    }
    
    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        let uk = try self.container.nestedUnkeyedContainer(forKey: self.preKey)
        if let r = uk as? SingleValueDecodingContainer { return r }
        else { fatalError("Unsupported method") }
    }
}
