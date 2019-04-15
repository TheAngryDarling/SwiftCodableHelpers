//
//  FilteredDelayedKeyedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 A Keyed encoding container that allows for fitering and delayed processing
*/
public class FilteredDelayedKeyedEncodingContainer<K>: FilteredKeyedEncodingContainer<K> where K: CodingKey {
    private var delayedContainer: DelayedKeyedEncodingContainer<K>
    public var wasContainerSet: Bool { return self.delayedContainer.wasContainerSet }
    
    public init(_ container: DelayedKeyedEncodingContainer<K>, rootContainer: FilteredEncodingContainer? = nil, filter: @escaping FilterEncoding) {
        self.delayedContainer = container
        super.init(KeyedEncodingContainer<K>(container), rootContainer: rootContainer, filter: filter)
    }
    public convenience init(codingPath: [CodingKey], rootContainer: FilteredEncodingContainer? = nil, filter: @escaping FilterEncoding) {
        self.init(DelayedKeyedEncodingContainer<K>(codingPath: codingPath), rootContainer: rootContainer, filter: filter)
    }
    
    public func initializeContainer(fromParent parent: inout UnkeyedEncodingContainer) throws  {
        try self.delayedContainer.initializeContainer(fromParent: &parent)
    }
    
    public func initializeContainer<ParentKey>(fromParent parent: inout KeyedEncodingContainer<ParentKey>, forKey key: ParentKey) throws /* where ParentKey : CodingKey */ {
        try self.delayedContainer.initializeContainer(fromParent: &parent, forKey: key)
    }
    
    public override func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: K) -> KeyedEncodingContainer<NestedKey> /* where NestedKey : CodingKey */ {
        let n = self.delayedContainer.nestedDelayedContainer(keyedBy: keyType, forKey: key)
        let rtn = FilteredDelayedKeyedEncodingContainer<NestedKey>(n, rootContainer: self.rootContainer ?? self, filter: self.filterEncoding)
        return KeyedEncodingContainer<NestedKey>(rtn)
        
    }
    
    public override func nestedUnkeyedContainer(forKey key: K) -> UnkeyedEncodingContainer {
        let n = self.delayedContainer.nestedUnkeyedContainer(forKey: key)
        let rtn = FilteredDelayedUnkeyedEncodingContainer(n as! DelayedUnkeyedEncodingContainer, rootContainer: self.rootContainer ?? self, filter: self.filterEncoding)
        return rtn
    }
    
}
