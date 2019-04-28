//
//  DelayedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 Base class for delayed encoding container
*/
public class DelayedEncodingContainer {

    public private(set) var codingPath: [CodingKey]
    public private(set) var wasContainerSet: Bool = false
    
    public init(codingPath: [CodingKey]) {
        self.codingPath = codingPath
    }
    
    public func initializeContainer(fromParent parent: inout UnkeyedEncodingContainer) throws {
        self.wasContainerSet = true
    }
    
    public func initializeContainer<ParentKey>(fromParent parent: inout KeyedEncodingContainer<ParentKey>,
                                               forKey key: ParentKey) throws /* where ParentKey : CodingKey */ {
        self.wasContainerSet = true
        self.codingPath.append(key)
    }
}
