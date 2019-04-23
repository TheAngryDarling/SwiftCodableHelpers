//
//  BridgedKeyEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-05.
//

import Foundation

/*
 A encoding container that bridges from one CodingKey type to another CodingKey type
 */
public class BridgedKeyedEncodingContainer<FromKey, ToKey>: KeyedEncodingContainerProtocol where FromKey: CodingKey, ToKey: CodingKey {
    public typealias Key = ToKey
    
    public enum BridgedEncodingError: Error {
        case keyNotFound(CodingKey, EncodingError.Context)
    }
    
    private var container: KeyedEncodingContainer<FromKey>
    
    //public var codingPath: [CodingKey] { return container.codingPath }
    public let codingPath: [CodingKey]
    
    public init(_ container: KeyedEncodingContainer<FromKey>) {
        self.container = container
        self.codingPath = container.codingPath
    }
    public init<Container>(_ container: Container) where FromKey == Container.Key, Container : KeyedEncodingContainerProtocol {
        self.container = KeyedEncodingContainer(container)
        self.codingPath = container.codingPath
    }
    
    
    private func convertKey(_ from: Key) throws -> FromKey {
        guard let rtn = FromKey(stringValue: from.stringValue) else {
            throw BridgedEncodingError.keyNotFound(from, EncodingError.Context.init(codingPath: self.codingPath, debugDescription: "Could not convert key '\(from.stringValue)' of type \(type(of: from)) to type \(FromKey.self)"))
            //fatalError("Invalid Key")
        }
        return rtn
    }
    
    public func encodeNil(forKey key: Key) throws {
        try self.container.encodeNil(forKey: try convertKey(key))
    }
    
    public func encode(_ value: Bool, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: String, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Double, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Float, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Int, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Int8, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Int16, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Int32, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: Int64, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: UInt, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: UInt8, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: UInt16, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: UInt32, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode(_ value: UInt64, forKey key: Key) throws {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        try self.container.encode(value, forKey: try convertKey(key))
    }
    
    public func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        return self.container.nestedContainer(keyedBy: keyType, forKey: try! convertKey(key))
    }
    
    public func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        return self.container.nestedUnkeyedContainer(forKey: try! convertKey(key))
    }
    
    public func superEncoder() -> Encoder {
        return self.container.superEncoder()
    }
    
    public func superEncoder(forKey key: Key) -> Encoder {
        return self.container.superEncoder(forKey: try! convertKey(key))
    }
}
