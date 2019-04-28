//
//  WrappedUnkeyedEncodingContainer.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-04-26.
//

import Foundation

open class WrappedUnkeyedEncodingContainer: UnkeyedEncodingContainer {
    
    private var container: UnkeyedEncodingContainer
    public let codingPath: [CodingKey]
    
    private let disableRepackagingErrors: Bool
    
    public var count: Int { return self.container.count }
    
    
    public init(_ container: UnkeyedEncodingContainer, customCodingPath: [CodingKey]? = nil) {
        self.container = container
        self.codingPath = customCodingPath ?? container.codingPath
        self.disableRepackagingErrors = (customCodingPath == nil || (customCodingPath!.stringPath == container.codingPath.stringPath))
    }
    
    
    open func encodeNil() throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encodeNil()
        }
    }
    
    open func encode(_ value: Bool) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: String) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Double) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Float) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Int) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Int8) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Int16) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Int32) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: Int64) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: UInt) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: UInt8) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: UInt16) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: UInt32) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode(_ value: UInt64) throws {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            try self.container.encode(value)
        }
    }
    
    open func encode<T>(_ value: T) throws where T : Encodable {
        try WrappedCodingErrors.repackage(self.codingPath.appending(index: self.count),
                                          disableRepackagingErrors) {
            // TODO: -  Will need to figure out how to properly wrap
            // try self.container.encode(value)
            let e = self.superEncoder()
            try value.encode(to: e)
        }
    }
    
    open func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let c = WrappedKeyedEncodingContainer<NestedKey>(self.container.nestedContainer(keyedBy: keyType),
                                                         customCodingPath: self.codingPath.appending(index: self.count))
        return KeyedEncodingContainer(c)
    }
    
    open func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        return WrappedUnkeyedEncodingContainer(self.container.nestedUnkeyedContainer(),
                                               customCodingPath: self.codingPath.appending(index: self.count))
    }
    
    open func superEncoder() -> Encoder {
        return WrappedEncoder(self.container.superEncoder(),
                              customCodingPath: self.codingPath.appending(stringValue: "super"))
    }
}
