//
//  DelayedUnkeyedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 Delayed unkeyed encoding container used to encode elements in memory until initializeContainer is called
 */
public class DelayedUnkeyedEncodingContainer: DelayedEncodingContainer, UnkeyedEncodingContainer {
    
    private typealias CacheCall = (_ container: inout UnkeyedEncodingContainer) throws -> Void
    
    private var container: UnkeyedEncodingContainer? = nil
    
    private var cache: [CacheCall] = []
    
    public var count: Int {
        if let c = self.container { return c.count }
        else { return self.cache.count }
    }
    
    fileprivate func processCache() throws {
        while self.cache.count > 0 {
            let c = self.cache.remove(at: 0)
            try c(&self.container!)
        }
    }
    public override func initializeContainer(fromParent parent: inout UnkeyedEncodingContainer) throws {
        try super.initializeContainer(fromParent: &parent)
        self.container = parent//parent.nestedUnkeyedContainer()
        try self.processCache()
    }
    
    public override func initializeContainer<ParentKey>(fromParent parent: inout KeyedEncodingContainer<ParentKey>,
                                                        forKey key: ParentKey) throws /* where ParentKey : CodingKey */ {
        try super.initializeContainer(fromParent: &parent, forKey: key)
        self.container = parent.nestedUnkeyedContainer(forKey: key)
        try self.processCache()
    }
    
    public func encodeNil() throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encodeNil()
            })
            return
        }
        try c.encodeNil()
    }
    
    public func encode(_ value: Bool) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: String) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Double) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Float) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Int) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Int8) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Int16) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Int32) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: Int64) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: UInt) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: UInt8) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: UInt16) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: UInt32) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode(_ value: UInt64) throws {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func encode<T>(_ value: T) throws where T : Encodable {
        guard var c = self.container else  {
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try container.encode(value)
            })
            return
        }
        try c.encode(value)
    }
    
    public func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> /* where NestedKey : CodingKey */ {
        guard var c = self.container else  {
            var subPath: [CodingKey] = []
            subPath.append(contentsOf: self.codingPath)
            let rtn = DelayedKeyedEncodingContainer<NestedKey>(codingPath: subPath)
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try rtn.initializeContainer(fromParent: &container)
            })
            return KeyedEncodingContainer<NestedKey>(rtn)
        }
        return c.nestedContainer(keyedBy: keyType)
    }
    
    public func nestedDelayedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> DelayedKeyedEncodingContainer<NestedKey> /* where NestedKey : CodingKey */ {
        var subPath: [CodingKey] = []
        subPath.append(contentsOf: self.codingPath)
        
        guard var c = self.container else  {
            let rtn = DelayedKeyedEncodingContainer<NestedKey>(codingPath: subPath)
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try rtn.initializeContainer(fromParent: &container)
            })
            return rtn
        }
        let rtn = DelayedKeyedEncodingContainer<NestedKey>(codingPath: subPath)
        try! rtn.initializeContainer(fromParent: &c)
        return rtn
        
    }
    
    public func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        guard var c = self.container else  {
            var subPath: [CodingKey] = []
            subPath.append(contentsOf: self.codingPath)
            let rtn = DelayedUnkeyedEncodingContainer(codingPath: subPath)
            cache.append({ (container: inout UnkeyedEncodingContainer) throws -> Void in
                try rtn.initializeContainer(fromParent: &container)
            })
            return rtn
        }
        return c.nestedUnkeyedContainer()
    }
    
    public func superEncoder() -> Encoder {
        if var c = self.container { return c.superEncoder() }
        else { fatalError("Container currently not set") }
    }
}
