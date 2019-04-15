//
//  BridgedKeyDecodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-05.
//

import Foundation

/*
    A decoding container that bridges from one CodingKey type to another CodingKey type
*/
public class BridgedKeyedDecodingContainer<FromKey, ToKey>: KeyedDecodingContainerProtocol where FromKey: CodingKey, ToKey: CodingKey {
    public typealias Key = ToKey
    
    private var container: KeyedDecodingContainer<FromKey>
    
    public var codingPath: [CodingKey] { return container.codingPath }
    public var allKeys: [Key] {
        var rtn: [Key] = []
        for k in self.container.allKeys {
            if let key = Key(stringValue: k.stringValue) {
                rtn.append(key)
            }
        }
        return rtn
    }
    
    public init(_ container: KeyedDecodingContainer<FromKey>) { self.container = container }
    public init<Container>(_ container: Container) where FromKey == Container.Key, Container : KeyedDecodingContainerProtocol {
        self.container = KeyedDecodingContainer(container)
    }
    
    
    private func convertKey(_ from: Key) throws -> FromKey {
        guard let rtn = FromKey(stringValue: from.stringValue) else {
            throw DecodingError.keyNotFound(from, DecodingError.Context.init(codingPath: self.codingPath, debugDescription: "Could not convert key '\(from.stringValue)' of type \(type(of: from)) to type \(FromKey.self)"))
            //fatalError("Invalid Key")
        }
        return rtn
    }
    
    public func contains(_ key: Key) -> Bool {
        guard let fKey = FromKey(stringValue: key.stringValue) else { return false }
        return self.container.contains(fKey)
    }
    
    public func decodeNil(forKey key: Key) throws -> Bool {
        return try self.container.decodeNil(forKey: try convertKey(key))
    }
    
    public func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: String.Type, forKey key: Key) throws -> String {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
        return try self.container.decode(type, forKey: try convertKey(key))
    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        return try self.container.nestedContainer(keyedBy: type, forKey: try convertKey(key))
    }
    
    public func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        return try self.container.nestedUnkeyedContainer(forKey: try convertKey(key))
    }
    
    public func superDecoder() throws -> Decoder {
        return try self.container.superDecoder()
    }
    
    public func superDecoder(forKey key: Key) throws -> Decoder {
        return try self.container.superDecoder(forKey: try convertKey(key))
    }
    
}
