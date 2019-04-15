//
//  FilteredDelayedUnkeyedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 An Unkeyed encoding container that allows for fitering and delayed processing
 */
public class FilteredDelayedUnkeyedEncodingContainer: FilteredUnkeyedEncodingContainer {
    private var delayedContainer: DelayedUnkeyedEncodingContainer
    
    public init(_ container: DelayedUnkeyedEncodingContainer,
                rootContainer: FilteredEncodingContainer? = nil,
                filter: @escaping FilterEncoding) {
        self.delayedContainer = container
        super.init(container, rootContainer: rootContainer, filter: filter)
    }
    public convenience init(codingPath: [CodingKey],
                            rootContainer: FilteredEncodingContainer? = nil,
                            filter: @escaping FilterEncoding) {
        self.init(DelayedUnkeyedEncodingContainer(codingPath: codingPath), rootContainer: rootContainer, filter: filter)
    }
    
    public func initializeContainer(fromParent parent: inout UnkeyedEncodingContainer) throws  {
        try self.delayedContainer.initializeContainer(fromParent: &parent)
    }
    
    public func initializeContainer<ParentKey>(fromParent parent: inout KeyedEncodingContainer<ParentKey>,
                                               forKey key: ParentKey) throws /* where ParentKey : CodingKey */ {
        try self.delayedContainer.initializeContainer(fromParent: &parent,
                                                      forKey: key)
    }
    
    
    
    public override func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> /* where NestedKey : CodingKey */ {
        let n = self.delayedContainer.nestedDelayedContainer(keyedBy: keyType)
        let rtn = FilteredDelayedKeyedEncodingContainer<NestedKey>(n,
                                                                   rootContainer: self.rootContainer ?? self,
                                                                   filter: self.filterEncoding)
        return KeyedEncodingContainer<NestedKey>(rtn)
        
    }
    
    public override func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let n = self.delayedContainer.nestedUnkeyedContainer()
        let rtn = FilteredDelayedUnkeyedEncodingContainer(n as! DelayedUnkeyedEncodingContainer,
                                                          rootContainer: self.rootContainer ?? self,
                                                          filter: self.filterEncoding)
        return rtn
    }
    
}
