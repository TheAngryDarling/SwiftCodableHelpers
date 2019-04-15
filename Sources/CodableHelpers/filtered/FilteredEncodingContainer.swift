//
//  FilteredEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 Base class for filtered encoding containers
*/
public class FilteredEncodingContainer {
     public typealias FilteredEncodedCallResults = Bool
    public typealias FilterEncoding = (FilteredEncodingContainer, FilteredEncodingContainer, String, CodingKey?, Any?) throws -> FilteredEncodedCallResults
    public let codingPath: [CodingKey]
    internal private(set) var filterEncoding: FilterEncoding
    
    internal private(set) var rootContainer: FilteredEncodingContainer?
    
    public init(codingPath: [CodingKey], rootContainer: FilteredEncodingContainer? = nil, filter: @escaping FilterEncoding) {
        self.codingPath = codingPath
        self.rootContainer = rootContainer
        self.filterEncoding = filter
    }
    
    internal func canEncode(method: String, childKey: CodingKey? = nil, value: Any?) throws -> FilteredEncodedCallResults {
        let r = self.rootContainer ?? self
        
        let rtn = try self.filterEncoding(r, self, method, childKey, value)
        return rtn
    }
}
