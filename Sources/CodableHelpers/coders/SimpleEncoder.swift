//
//  DictionaryEncoder.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2018-11-06.
//

import Foundation

/*
 A Simple encoder that converts objects into their base encoded data set eg, base types, arrays, dictionaries
*/
public final class SimpleEncoder: BasicOpenEncoder<Any> {
    public init() {
        super.init() { e, v in
            return v
        }
    }
}
