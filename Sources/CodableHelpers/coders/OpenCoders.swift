//
//  OpenCoders.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-27.
//

import Foundation

import CoreFoundation
import SwiftClassCollections
import Nillable

/// Open Encoder base used for creating custom encoders that return specific results
open class BasicOpenEncoder<EncodingResults>: BaseEncoder, EncodingType {
    public typealias TranformationMethod = (BasicOpenEncoder<EncodingResults>, Any) throws -> EncodingResults
    
    private var _transformation: TranformationMethod
    
    // MARK: - Constructing a Basic Encoder
    /// Initializes `self` with default strategies.
    public init(boxing: BaseEncoderTypeBoxing? = nil, _ transformation: @escaping TranformationMethod) {
        self._transformation = transformation
        super.init(boxing: boxing)
    }
    
    // MARK: - Encoding Values
    /// Encodes the given top-level value and returns its Basic representation.
    ///
    /// - parameter value: The value to encode.
    /// - returns: A new `Data` value containing the encoded Basic data.
    /// - throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
    /// - throws: An error if any value throws an error during encoding.
    open func encode<T : Encodable>(_ value: T) throws -> EncodingResults {
        let encoder = _BaseEncoder(self, options: self.options)
        
        guard var topLevel = try encoder.box_(value) else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) did not encode any values."))
        }
        
        //if topLevel is NSNull {
        if isNil(topLevel) {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(T.self) encoded as null \(type(of: self)) fragment."))
        }
        
        if let box = topLevel as? SCArrayOrderedDictionary<String, Any> { topLevel = encoder.excapeMutableObjects(box) }
        else if let box = topLevel as? SCArray<Any> { topLevel = encoder.excapeMutableObjects(box) }
        
        return try self._transformation(self, topLevel)
        
    }
}

#if swift(>=4.1)
extension BasicOpenEncoder: EncodingToDataType where EncodingResults == Data { }
#endif

/// Open Decoder base used for creating custom encoders that use specific input
open class BasicOpenDecoder<DecodingInput>: BaseDecoder, DecodingType {
    public typealias TranformationMethod = (BasicOpenDecoder<DecodingInput>, DecodingInput) throws -> Any
    
    private var _transformation: TranformationMethod
    
    // MARK: - Constructing a Basic Encoder
    /// Initializes `self` with default strategies.
    public init(unboxer: BaseDecoderTypeUnboxing? = nil, transformation: @escaping TranformationMethod) {
        self._transformation = transformation
        super.init(unboxer: unboxer)
    }
    
    // MARK: - Decoding Values
    /// Decodes a top-level value of the given type from the given Basic representation.
    ///
    /// - parameter type: The type of the value to decode.
    /// - parameter data: The data to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid Basic.
    /// - throws: An error if any value throws an error during decoding.
    open func decode<T : Decodable>(_ type: T.Type, from data: DecodingInput) throws -> T {
        let topLevel: Any
        do {
            topLevel = try self._transformation(self, data)
        } catch {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid Basic.", underlyingError: error))
        }
        
        let decoder = _BaseDecoder(self, referencing: topLevel, options: self.options)
        guard let value = try decoder.unbox(topLevel, as: type) else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: [], debugDescription: "The given data did not contain a top-level value."))
        }
        
        return value
    }
}

#if swift(>=4.1)
extension BasicOpenDecoder: DecodingFromDataType where DecodingInput == Data { }
#endif
