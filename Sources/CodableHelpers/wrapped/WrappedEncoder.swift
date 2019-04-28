//
//  WrappedEncoder.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-04-26.
//

import Foundation

open class WrappedEncoder: Encoder {

    private let encoder: Encoder
    public let codingPath: [CodingKey]
    
    open var userInfo: [CodingUserInfoKey : Any] { return self.encoder.userInfo }
    
    
    public init(_ encoder: Encoder, customCodingPath: [CodingKey]? = nil) {
        self.encoder = encoder
        self.codingPath = customCodingPath ?? encoder.codingPath
    }
    
    
    open func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        let c = WrappedKeyedEncodingContainer<Key>(self.encoder.container(keyedBy: type),
                                                    customCodingPath: self.codingPath)
        return KeyedEncodingContainer(c)
        
    }
    
    open func unkeyedContainer() -> UnkeyedEncodingContainer {
        return WrappedUnkeyedEncodingContainer(self.encoder.unkeyedContainer(),
                                               customCodingPath: self.codingPath)
    }
    
    open func singleValueContainer() -> SingleValueEncodingContainer {
        return WrappedSingleValueEncodingContainer(self.encoder.singleValueContainer(),
                                                   customCodingPath: self.codingPath)
    }
    
}


