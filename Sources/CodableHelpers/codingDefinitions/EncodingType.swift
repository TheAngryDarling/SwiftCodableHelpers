//
//  EncodingType.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-24.
//

import Foundation


/// Basic protocol that defines an Encoder like JSONEncoder and PropertyListEncoder
public protocol EncodingType: class {
    /// The data type used to encode to.  Normally this is Data
    associatedtype EncodedData
    
    /// A dictionary you use to customize the encoding process by providing contextual information.
    var userInfo: [CodingUserInfoKey : Any] { get set}
    
    /// Returns a encoded representation of the value you supply.
    ///
    /// - Parameter value: The value to encode
    /// - Returns: Returns the EncodedData representation of value
    func encode<T>(_ value: T) throws -> EncodedData where T : Encodable
}

/// Protocol that defines encoders that return Data as the results
public protocol EncodingToDataType: EncodingType {
    associatedtype EncodedData = Data
}


extension JSONEncoder: EncodingToDataType { }

// PropertyListEncoder is only available on the Apple Swift SDK, NOT the open Swift SDK
#if _runtime(_ObjC)
extension PropertyListEncoder: EncodingToDataType { }
#endif

