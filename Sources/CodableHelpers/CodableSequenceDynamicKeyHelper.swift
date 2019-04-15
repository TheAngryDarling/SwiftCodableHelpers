//
//  CodableSequenceDynamicKeyHelper.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-03.
//

import Foundation

/*
 Simple helper protocol that can be used on any sequence to encode/deocde based on a specific key
*/
public protocol CodableSequenceDynamicKeyHelper: CodableSequenceDynamicElementHelper where Element: Codable { }
extension CodableSequenceDynamicKeyHelper {
    public static func dynamicDecoding( _ decoder: Decoder) throws -> Element {
        return try Element(from: decoder)
    }
}





