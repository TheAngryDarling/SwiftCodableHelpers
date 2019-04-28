//
//  DecodingType.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-24.
//

import Foundation


/*
 Basic protocol that defines a Decoder like JSONDecoder and PropertyListDecoder
 */
public protocol DecodingType: class {
    associatedtype EncodedData
    
    var userInfo: [CodingUserInfoKey : Any] { get set}
    
    func decode<T>(_ type: T.Type, from data: EncodedData) throws -> T where T : Decodable
}

/*
 Protocol that defines decoders that take in Data as the parameter
 */
public protocol DecodingFromDataType: DecodingType {
    associatedtype EncodedData = Data
}


extension JSONDecoder: DecodingFromDataType { }

// PropertyListDecoder is only available on the Apple Swift SDK, NOT the open Swift SDK
#if _runtime(_ObjC)
extension PropertyListDecoder: DecodingFromDataType { }
#endif
