//
//  EncoderChoice.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-09-03.
//

import Foundation
import BasicCodableHelpers

/// Programmable Choice for picking an Encoder
///
/// - xmlPList: Property List using xml format
/// - binaryPList: Property List using binary format
/// - json: JSON
/// - other:
public enum EncoderChoice {
    case xmlPList
    case binaryPList
    case json
    case other(StandardEncoderType)
}

/// Programmable Choice for picking a Decoder
///
/// - plist: Property List
/// - json: JSON
/// - other:
public enum DecoderChoice {
    /// Flag indicator used to determin which JSON decoder to use (BasicCodableHelperPatchedJSONDecoder or JSONDecoder) when working on Swift < 4.2
    public static var usePatchedJSONDecoder: Bool = true
    case plist
    case json
    case other(StandardDecoderType)
}

extension EncoderChoice: BasicCodableHelperCaseIterable {
    /// Provides all simple encoder choices (excludes other)
    public static var allCases: [EncoderChoice] {
        var rtn: [EncoderChoice] = []
        rtn.append(.xmlPList)
        rtn.append(.binaryPList)
        rtn.append(.json)
        return rtn
    }
}
extension DecoderChoice: BasicCodableHelperCaseIterable {
    /// Provides all simple decoder chocies (excludes other)
    public static var allCases: [DecoderChoice] {
        var rtn: [DecoderChoice] = []
        rtn.append(.plist)
        rtn.append(.json)
        return rtn
    }
}


public extension EncoderChoice {
    
    /// Provides the standard encoder for the selected choice
    var encoder: StandardEncoderType {
        let rtn: StandardEncoderType
        switch self {
            case .xmlPList:
                rtn = PropertyListEncoder()
                (rtn as! PropertyListEncoder).outputFormat = .xml
            case .binaryPList:
                rtn = PropertyListEncoder()
                (rtn as! PropertyListEncoder).outputFormat = .binary
            case .json: rtn = JSONEncoder()
            case .other(let obj): rtn = obj
        }
        
        return rtn
    }
    
    /// Provides the decoder choice equivilant to this encoder choice if one is available
    var decoderChoice: DecoderChoice? {
        let rtn: DecoderChoice?
        switch self {
            case .xmlPList: rtn = .plist
            case .binaryPList: rtn = .plist
            case .json: rtn = .json
            case .other(_): rtn = nil
        }
        return rtn
    }
    
    /// Provides the standard decoder for the selected choice if one is available
    var decoder: StandardDecoderType? {
        return self.decoderChoice?.decoder
    }
}

public extension DecoderChoice {
    /// Provides the standard decoder for the selected choice
    var decoder: StandardDecoderType {
        let rtn: StandardDecoderType
        switch self {
            case .plist: rtn = PropertyListDecoder()
            case .json:
                if DecoderChoice.usePatchedJSONDecoder {
                    rtn = BasicCodableHelperPatchedJSONDecoder()
                } else {
                    rtn = JSONDecoder()
                }
            case .other(let obj): rtn = obj
        }
        
        return rtn
    }
}
