//
//  FilteredUnkeyedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation


/*
 Filtered unkeyed encoding container.  Allows coder to fileter out specific keyed objecs when encoding
 */
public class FilteredUnkeyedEncodingContainer: FilteredEncodingContainer, UnkeyedEncodingContainer {
    
    private var container: UnkeyedEncodingContainer
    
    public var count: Int { return self.container.count }
    
    public init(_ container: UnkeyedEncodingContainer, rootContainer: FilteredEncodingContainer? = nil, filter: @escaping FilterEncoding) {
        self.container = container
        super.init(codingPath: container.codingPath, rootContainer: rootContainer, filter: filter)
    }
    
    public func encodeNil() throws {
        if try self.canEncode(method: "encodeNil", value: nil) {
            try self.container.encodeNil()
        }
    }
    
    public func encode(_ value: Bool) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: String) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Double) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Float) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Int) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Int8) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Int16) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Int32) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: Int64) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: UInt) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: UInt8) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: UInt16) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: UInt32) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode(_ value: UInt64) throws {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func encode<T>(_ value: T) throws where T : Encodable {
        if try self.canEncode(method: "encode", value: value) {
            try self.container.encode(value)
        }
    }
    
    public func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let n = self.container.nestedContainer(keyedBy: keyType)
        let rtn = FilteredKeyedEncodingContainer<NestedKey>(n, rootContainer: self.rootContainer ?? self, filter: self.filterEncoding)
        return KeyedEncodingContainer<NestedKey>(rtn)
    }
    
    public func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let n = self.container.nestedUnkeyedContainer()
        let rtn = FilteredUnkeyedEncodingContainer(n, rootContainer: self.rootContainer ?? self, filter: self.filterEncoding)
        return rtn
    }
    
    public func superEncoder() -> Encoder {
        return self.container.superEncoder()
    }
}
