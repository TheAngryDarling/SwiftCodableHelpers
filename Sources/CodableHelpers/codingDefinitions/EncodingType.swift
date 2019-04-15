//
//  EncodingType.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-24.
//

import Foundation


/*
 Basic protocol that defines an Encoder like JSONEncoder and PropertyListEncoder
*/
public protocol EncodingType {
    associatedtype EncodedData
    
    func encode<T>(_ value: T) throws -> EncodedData where T : Encodable
}

/*
 Protocol that defines encoders that return Data as the results
*/
public protocol EncodingToDataType: EncodingType {
    associatedtype EncodedData = Data
}


extension JSONEncoder: EncodingToDataType { }

// PropertyListEncoder is only available on the Apple Swift SDK, NOT the open Swift SDK
#if _runtime(_ObjC)
extension PropertyListEncoder: EncodingToDataType { }
#endif

