//
//  ClosedCoders.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-03-27.
//

import Foundation
import Nillable
import SwiftClassCollections


/// Closed Encoder base used for creating encoders that only work with one type
open class BasicClosedEncoder<EncodingType, EncodingResults>: BaseEncoder where EncodingType: Encodable {
    public typealias TranformationMethod = (BasicClosedEncoder<EncodingType, EncodingResults>, Any) throws -> EncodingResults
    
    private let _transformation: TranformationMethod
    private let dictionaryReEncapsulation: ReEncapsulatableDictionaries
    private let arrayReEncapsulation: ReEncapsulatableArrays
    // MARK: - Constructing a Basic Encoder
    /// Initializes `self` with default strategies.
    public init(boxing: BaseEncoderTypeBoxing? = nil,
                dictionaryReEncapsulation: ReEncapsulatableDictionaries = .dictionary,
                arrayReEncapsulation: ReEncapsulatableArrays = .array,
                _ transformation: @escaping TranformationMethod) {
        self._transformation = transformation
        self.dictionaryReEncapsulation = dictionaryReEncapsulation
        self.arrayReEncapsulation = arrayReEncapsulation
        super.init(boxing: boxing)
    }
    
    // MARK: - Encoding Values
    /// Encodes the given top-level value and returns its Basic representation.
    ///
    /// - parameter value: The value to encode.
    /// - returns: A new `Data` value containing the encoded Basic data.
    /// - throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
    /// - throws: An error if any value throws an error during encoding.
    open func encode(_ value: EncodingType) throws -> EncodingResults {
        let encoder = BaseEncoder._BaseEncoder(self, options: self.options)
        
        guard var topLevel = try encoder.box_(value) else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(EncodingType.self) did not encode any values."))
        }
        
        
        if isNil(topLevel) {
            //if topLevel is NSNull {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: [], debugDescription: "Top-level \(EncodingType.self) encoded as null \(type(of: self)) fragment."))
        }
        
        if let d = topLevel as? SCArrayOrderedDictionary<String, Any> {
            topLevel = d.reencapsulatable(dictionariesTo: self.dictionaryReEncapsulation,
                                          arraysTo: self.arrayReEncapsulation)
    
        } else if let d = topLevel as? SCDictionary<String, Any> {
            topLevel = d.reencapsulatable(dictionariesTo: self.dictionaryReEncapsulation,
                                          arraysTo: self.arrayReEncapsulation)
        } else if let d = topLevel as? Dictionary<String, Any> {
            topLevel = d.reencapsulatable(dictionariesTo: self.dictionaryReEncapsulation,
                                          arraysTo: self.arrayReEncapsulation)
        } else if let a = topLevel as? SCArray<Any> {
            topLevel = a.reencapsulatable(dictionariesTo: self.dictionaryReEncapsulation,
                                          arraysTo: self.arrayReEncapsulation)
        } else if let a = topLevel as? Array<Any> {
            topLevel = a.reencapsulatable(dictionariesTo: self.dictionaryReEncapsulation,
                                          arraysTo: self.arrayReEncapsulation)
        }
        
        return try self._transformation(self, topLevel)
        
    }
}

/// Closed decoder base used for creating decoders that only work with one type
open class BasicClosedDecoder<DecodingType, DecodingInput>: BaseDecoder where DecodingType: Decodable {
    
    public typealias TranformationMethod = (BasicClosedDecoder<DecodingType, DecodingInput>, DecodingInput) throws -> Any
    
    private var _transformation: TranformationMethod
    
    // MARK: - Constructing a Basic Decoder
    /// Initializes `self` with default strategies.
    public init(unboxing: BaseDecoderTypeUnboxing? = nil, _ transformation: @escaping TranformationMethod) {
        self._transformation = transformation
        super.init(unboxing: unboxing)
    }
    
    @available(*, deprecated, renamed: "init(unboxing:)")
    public init(unboxer: BaseDecoderTypeUnboxing?, _ transformation: @escaping TranformationMethod) {
        self._transformation = transformation
        super.init(unboxing: unboxer)
    }
    
    // MARK: - Decoding Values
    /// Decodes a top-level value of the given type from the given Basic representation.
    ///
    /// - parameter data: The data to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid Basic.
    /// - throws: An error if any value throws an error during decoding.
    open func decode(from data: DecodingInput) throws -> DecodingType {
        let topLevel: Any
        do {
            topLevel = try self._transformation(self, data)
        } catch {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid Basic.", underlyingError: error))
        }
        
        let decoder = _BaseDecoder(self, referencing: topLevel, options: self.options)
        guard let value = try decoder.unbox(topLevel, as: DecodingType.self) else {
            throw DecodingError.valueNotFound(DecodingType.self, DecodingError.Context(codingPath: [], debugDescription: "The given data did not contain a top-level value."))
        }
        
        return value
    }
    
}
