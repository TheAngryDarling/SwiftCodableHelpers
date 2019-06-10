//
//  SDictionary.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-04-10.
//

import Foundation
import SwiftClassCollections

extension SDictionary {
    /// Add intnerla static property to identify what type of dictionary this is.
    /// Right now we only support three types of dictionaries, Dictionary, SCDictionary, and SCArrayOrderedDictionary
    internal static var ReEncapsulatableType: ReEncapsulatableDictionaries {
        if self == Dictionary<Key,Value>.self { return ReEncapsulatableDictionaries.dictionary }
        else if self == SCDictionary<Key,Value>.self { return ReEncapsulatableDictionaries.classDictionary }
        else if self == SCArrayOrderedDictionary<Key,Value>.self { return ReEncapsulatableDictionaries.arrayOrderedDictionary }
        else {
            fatalError("Unsupported Dictionary type \(self).  Current supportd types are: Dictionary, SCDictionary, and SCArrayOrderedDictionary")
        }
    }
}
