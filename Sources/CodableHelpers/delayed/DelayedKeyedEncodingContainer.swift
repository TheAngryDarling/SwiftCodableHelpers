//
//  DelayedKeyedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 Delayed keyed encoding container used to encode elements in memory until initializeContainer is called
*/
public class DelayedKeyedEncodingContainer<K>: DelayedEncodingContainer, KeyedEncodingContainerProtocol where K: CodingKey {
    
    public typealias Key = K
    private typealias CacheCall = (_ container: inout KeyedEncodingContainer<Key>) throws -> Void
    
    private var container: KeyedEncodingContainer<Key>? = nil
    
    private var cache: [CacheCall] = []
    
    fileprivate func processCache() throws {
        while self.cache.count > 0 {
            let c = self.cache.remove(at: 0)
            try c(&self.container!)
        }
    }
    public override func initializeContainer(fromParent parent: inout UnkeyedEncodingContainer) throws  {
        try super.initializeContainer(fromParent: &parent)
        self.container = parent.nestedContainer(keyedBy: Key.self)
        try self.processCache()
    }
    
    public override func initializeContainer<ParentKey>(fromParent parent: inout KeyedEncodingContainer<ParentKey>,
                                                        forKey key: ParentKey) throws /* where ParentKey : CodingKey */ {
        try super.initializeContainer(fromParent: &parent, forKey: key)
        self.container = parent.nestedContainer(keyedBy: Key.self, forKey: key)
        try self.processCache()
    }
    
    public func encodeNil(forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encodeNil(forKey: key)
            })
            return
        }
        try c.encodeNil(forKey: key)
    }
    
    public func encode(_ value: Bool, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: String, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Double, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Float, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Int, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Int8, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Int16, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Int32, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: Int64, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: UInt, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: UInt8, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: UInt16, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: UInt32, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode(_ value: UInt64, forKey key: K) throws {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func encode<T>(_ value: T, forKey key: K) throws where T : Encodable {
        guard var c = self.container else  {
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try container.encode(value, forKey: key)
            })
            return
        }
        try c.encode(value, forKey: key)
    }
    
    public func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type,
                                           forKey key: K) -> KeyedEncodingContainer<NestedKey> /* where NestedKey : CodingKey */ {
        guard var c = self.container else  {
            var subPath: [CodingKey] = []
            subPath.append(contentsOf: self.codingPath)
            subPath.append(key)
            let rtn = DelayedKeyedEncodingContainer<NestedKey>(codingPath: subPath)
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try rtn.initializeContainer(fromParent: &container, forKey: key)
            })
            return KeyedEncodingContainer<NestedKey>(rtn)
        }
        return c.nestedContainer(keyedBy: keyType, forKey: key)
        
    }
    
    internal func nestedDelayedContainer<NestedKey>(keyedBy keyType: NestedKey.Type,
                                                    forKey key: K) -> DelayedKeyedEncodingContainer<NestedKey> /* where NestedKey : CodingKey */ {
        var subPath: [CodingKey] = []
        subPath.append(contentsOf: self.codingPath)
        subPath.append(key)
        
        guard var c = self.container else  {
            let rtn = DelayedKeyedEncodingContainer<NestedKey>(codingPath: subPath)
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try rtn.initializeContainer(fromParent: &container, forKey: key)
            })
            return rtn
        }
        
        let rtn = DelayedKeyedEncodingContainer<NestedKey>(codingPath: subPath)
        try! rtn.initializeContainer(fromParent: &c, forKey: key)
        return rtn
    }
    
    public func nestedUnkeyedContainer(forKey key: K) -> UnkeyedEncodingContainer {
        guard var c = self.container else  {
            var subPath: [CodingKey] = []
            subPath.append(contentsOf: self.codingPath)
            subPath.append(key)
            let rtn = DelayedUnkeyedEncodingContainer(codingPath: subPath)
            cache.append({ ( container: inout KeyedEncodingContainer<Key>) throws -> Void in
                try rtn.initializeContainer(fromParent: &container, forKey: key)
            })
            return rtn
        }
        return c.nestedUnkeyedContainer(forKey: key)
    }
    
    public func superEncoder() -> Encoder {
        if var c = self.container { return c.superEncoder() }
        else { fatalError("Container currently not set") }
    }
    
    public func superEncoder(forKey key: K) -> Encoder {
        if var c = self.container { return c.superEncoder(forKey: key) }
        else { fatalError("Container currently not set") }
    }
    
}
