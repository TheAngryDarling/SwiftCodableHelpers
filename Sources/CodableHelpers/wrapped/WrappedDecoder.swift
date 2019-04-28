//
//  WrappedDecoder.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-04-27.
//

import Foundation

open class WrappedDecoder: Decoder {
    
    private let decoder: Decoder
    public let codingPath: [CodingKey]
    
    private let disableRepackagingErrors: Bool
    
    open var userInfo: [CodingUserInfoKey : Any] { return self.decoder.userInfo }
    
    
    public init(_ decoder: Decoder, customCodingPath: [CodingKey]? = nil) {
        self.decoder = decoder
        self.codingPath = customCodingPath ?? decoder.codingPath
        self.disableRepackagingErrors = (customCodingPath == nil || (customCodingPath!.stringPath == decoder.codingPath.stringPath))
    }
    
    
    open func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        return try WrappedCodingErrors.repackage(self.codingPath, disableRepackagingErrors) {
            let c = WrappedKeyedDecodingContainer<Key>(try self.decoder.container(keyedBy: type),
                                                       customCodingPath: self.codingPath)
            return KeyedDecodingContainer(c)
        }
    }
    
    open func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return try WrappedCodingErrors.repackage(self.codingPath, disableRepackagingErrors) {
            return WrappedUnkeyedDecodingContainer(try self.decoder.unkeyedContainer(),
                                                   customCodingPath: self.codingPath)
        }
    }
    
    open func singleValueContainer() throws -> SingleValueDecodingContainer {
        return try WrappedCodingErrors.repackage(self.codingPath, disableRepackagingErrors) {
            return WrappedSingleValueDecodingContainer(try self.decoder.singleValueContainer(),
                                                       customCodingPath: self.codingPath)
        } 
    }
}
