//
//  InjectedKeyedDecodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 A wrapped Keyed Decoding Container that allows you to inject or replace key/value pair within the decoding process
 */
public class WrappedInjectedKeyedDecodingContainer<K>: KeyedDecodingContainerProtocol where K: CodingKey {
    public typealias Key = K
    
    private struct HashedKey: Hashable {
        
        let key: Key
        #if !swift(>=4.2)
        public var hashValue: Int { return key.stringValue.hashValue }
        #endif
        public init(_ key: Key) { self.key = key }
        public init(_ key: String) {
            self.init(Key(stringValue: key)!)
        }
        
        #if swift(>=4.2)
        public func hash(into hasher: inout Hasher) {
            hasher.combine(self.key.stringValue)
        }
        #endif
        
        static func == (lhs: WrappedInjectedKeyedDecodingContainer<K>.HashedKey, rhs: WrappedInjectedKeyedDecodingContainer<K>.HashedKey) -> Bool {
            return lhs.key.stringValue == rhs.key.stringValue
        }
    }
    
    private var injections: [HashedKey: Any] = [:]
    private var container: KeyedDecodingContainer<Key>
    public var codingPath: [CodingKey] { return self.container.codingPath }
    public var allKeys: [K] {
        var rtn: [K] = self.container.allKeys
        for k in self.injections.keys {
            // Must try and add injected keys if they do not exist alread
            if let kv = K(stringValue: k.key.stringValue) {
                if !rtn.contains(where: { $0.stringValue ==  k.key.stringValue }) {
                    rtn.append(kv)
                }
            }
        }
        return rtn
    }
    
    public init<Container>(_ container: Container, injections: [String: Any]) where K == Container.Key, Container : KeyedDecodingContainerProtocol {
        self.container = KeyedDecodingContainer<Key>(container)
        for (k,v) in injections {
            self.injections[HashedKey(k)] = v
        }
    }
    
    public convenience init<Container>(_ container: Container, injection: (key: String, value: Any)) where K == Container.Key, Container : KeyedDecodingContainerProtocol {
        self.init(container, injections: [injection.key: injection.value])
    }
    
    
    
    public func contains(_ key: K) -> Bool {
        return self.injections.keys.contains(HashedKey(key)) || self.container.contains(key)
    }
    
    public func decodeNil(forKey key: K) throws -> Bool {
        return try self.container.decodeNil(forKey: key)
    }
    
    public func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Bool else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: String.Type, forKey key: K) throws -> String {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? String else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Double else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Float else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Int else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Int8 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Int16 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Int32 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? Int64 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? UInt else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? UInt8 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? UInt16 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? UInt32 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        guard let aV = self.injections[HashedKey(key)], let v = aV as? UInt64 else { return try self.container.decode(type, forKey: key) }
        return v
    }
    
    public func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T : Decodable {
        guard let aV = self.injections[HashedKey(key)] else { return try self.container.decode(type, forKey: key) }
        if let v = aV as? T { return v }
        else if let d = aV as? [String: Any] {
            let injector = InjectedKeyedDecodingContainer<CodableKey>(self.codingPath.appending(key), injections: d)
            let decoder = WrappedKeyedDecoder<CodableKey>(injector)
            return try T(from: decoder)
        } else if let a = aV as? [Any] {
            let injector = InjectedUnkeyedDecodingContainer(self.codingPath.appending(key), objects: a)
            let decoder = WrappedUnkeyedDecoder(injector)
            return try T(from: decoder)
        } else {
            let injector = InjectedSingleValueDecodingContainer(self.codingPath.appending(key), object: aV)
            let decoder = WrappedSingleValueDecoder(injector)
            return try T(from: decoder)
            
            //throw DecodingError._typeMismatch(at: self.codingPath.appending(key), expectation: type, reality: aV)
        }
    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        guard let aV = self.injections[HashedKey(key)] else { return try self.container.nestedContainer(keyedBy: type, forKey: key) }
        if let d = aV as? [String: Any] {
            let injector = InjectedKeyedDecodingContainer<CodableKey>(self.codingPath.appending(key), injections: d)
            let bridge = BridgedKeyedDecodingContainer<CodableKey, NestedKey>(injector)
            return KeyedDecodingContainer<NestedKey>(bridge)
        } else {
            throw DecodingError._typeMismatch(at: self.codingPath.appending(key), expectation: type, reality: aV)
        }
    }
    
    public func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        guard let aV = self.injections[HashedKey(key)] else { return try self.container.nestedUnkeyedContainer(forKey: key) }
        var newPath: [CodingKey] = []
        newPath.append(contentsOf: self.codingPath)
        newPath.append(key)
        return InjectedUnkeyedDecodingContainer(newPath, object: aV)
    }
    
    public func superDecoder() throws -> Decoder {
        return try self.container.superDecoder()
    }
    
    public func superDecoder(forKey key: K) throws -> Decoder {
        return try self.container.superDecoder(forKey: key)
    }
    
    
}
