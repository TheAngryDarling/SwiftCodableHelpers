//
//  PListCoder.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-09-03.
//

import Foundation
import BasicCodableHelpers

#if !swift(>=5.1) && !_runtime(_ObjC)
public typealias PropertyListEncoder = PListEncoder
public typealias PropertyListDecoder = PListDecoder
#endif


open class PListEncoder: BasicOpenEncoder<Data> {
    public var outputFormat: PropertyListSerialization.PropertyListFormat = .xml
    
    public init() {
        super.init(boxing: nil) { e, v in
            let encoder = e as! PListEncoder
            return try PropertyListSerialization.data(fromPropertyList: v,
                                                      format: encoder.outputFormat,
                                                      options: 0)
        }
    }
}

#if !swift(>=4.0.9)
extension PListEncoder: StandardEncoderType, DataEncoderType { }
#endif

open class PListDecoder: BasicOpenDecoder<Data> {
    private static let READ_FORMAT_FLAG: String = "__PLIST_DECODER_READ_FORMAT__"
    private static let FORMAT: String = "__PLIST_DECODER_FORMAT__"
    
    public init() {
        super.init() { d, i in
            var format: PropertyListSerialization.PropertyListFormat = .xml
            let rtn = try PropertyListSerialization.propertyList(from: i, options: [], format: &format)
            if Thread.current.threadDictionary[PListDecoder.READ_FORMAT_FLAG] != nil {
                Thread.current.threadDictionary[PListDecoder.FORMAT] = format
            }
            
            return rtn
        }
    }
    ///Returns a value of the specified type by decoding a property list using the supplied format.
    public func decode<T>(_ type: T.Type, from data: Data, format: inout PropertyListSerialization.PropertyListFormat) throws -> T where T : Decodable {
        // Setup request for property list format
        Thread.current.threadDictionary[PListDecoder.READ_FORMAT_FLAG] = true
        defer {
            // Remove all flags
            Thread.current.threadDictionary[PListDecoder.READ_FORMAT_FLAG] = nil
            Thread.current.threadDictionary[PListDecoder.FORMAT] = nil
            
            //Thread.current.threadDictionary.removeObject(forKey: PListDecoder.READ_FORMAT_FLAG)
            //Thread.current.threadDictionary.removeObject(forKey: PListDecoder.FORMAT)
        }
        let rtn = try self.decode(type, from: data)
        format = Thread.current.threadDictionary[PListDecoder.FORMAT] as! PropertyListSerialization.PropertyListFormat
        return rtn
    }
}

#if !swift(>=4.0.9)
extension PListDecoder: StandardDecoderType, DataDecoderType { }
#endif
