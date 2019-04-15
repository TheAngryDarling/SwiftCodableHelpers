//
//  ReEncapsulatableCollecton.swift
//  CodableHelpers
//
//  Created by Tyler Anger on 2019-04-10.
//
// Internal coded used to re-encapsulate specific collections from one type to another.
// This will allow transforming SCArrayOrderedDictionary to Dictionary


import Foundation
import SwiftClassCollections

// Enum used to tell the reencapsulate function what dictionary type to use
internal enum ReEncapsulatableDictionaries {
    case dictionary
    case classDictionary
    case arrayOrderedDictionary
}

// Enum used to tell the reencapsulate function what array type to use
internal enum ReEncapsulatableArrays {
    case array
    case classArray
}

// Protocol used to identify what objects can be re-encapsulated
internal protocol ReEncapsulatableCollecton {
    func reencapsulatable(dictionariesTo: ReEncapsulatableDictionaries, arraysTo: ReEncapsulatableArrays) -> Any
}

// Add a default method for easily switching to swift only structures
extension ReEncapsulatableCollecton {
    internal func reencapsulateToSwift() -> Any {
        return reencapsulatable(dictionariesTo: .dictionary, arraysTo: .array)
    }
}


// MARK: - Implementations
// MARK: - Dictionary Implementations
extension Dictionary: ReEncapsulatableCollecton {
    internal func reencapsulatable(dictionariesTo: ReEncapsulatableDictionaries, arraysTo: ReEncapsulatableArrays) -> Any {
        switch dictionariesTo {
            case .dictionary:
                var rtn = Dictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
            case .classDictionary:
                let rtn = SCDictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
            case .arrayOrderedDictionary:
                let rtn = SCArrayOrderedDictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
        }
    }
}

// MARK: - SCDictionary Implementations
extension SCDictionary: ReEncapsulatableCollecton {
    internal func reencapsulatable(dictionariesTo: ReEncapsulatableDictionaries, arraysTo: ReEncapsulatableArrays) -> Any {
        switch dictionariesTo {
            case .dictionary:
                var rtn = Dictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
            case .classDictionary:
                let rtn = SCDictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
            case .arrayOrderedDictionary:
                let rtn = SCArrayOrderedDictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
        }
    }
}

// MARK: - SCArrayOrderedDictionary Implementations
extension SCArrayOrderedDictionary: ReEncapsulatableCollecton {
    internal func reencapsulatable(dictionariesTo: ReEncapsulatableDictionaries, arraysTo: ReEncapsulatableArrays) -> Any {
        switch dictionariesTo {
            case .dictionary:
                var rtn = Dictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
            case .classDictionary:
                let rtn = SCDictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
            case .arrayOrderedDictionary:
                let rtn = SCArrayOrderedDictionary<Key, Value>()
                for (k,v) in self {
                    guard let r = v as? ReEncapsulatableCollecton else {
                        rtn[k] = v
                        continue
                    }
                    rtn[k] = (r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Value)
                }
                return rtn
        }
    }
}


// MARK: - Array Implementations
extension Array: ReEncapsulatableCollecton {
    internal func reencapsulatable(dictionariesTo: ReEncapsulatableDictionaries, arraysTo: ReEncapsulatableArrays) -> Any {
        
        switch arraysTo {
            case .array:
                var rtn = Array<Element>()
                for e in self {
                    guard let r = e as? ReEncapsulatableCollecton else {
                        rtn.append(e)
                        continue
                    }
                    rtn.append((r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Element) )
                }
                return rtn
            case .classArray:
                let rtn = SCArray<Element>()
                for e in self {
                    guard let r = e as? ReEncapsulatableCollecton else {
                        rtn.append(e)
                        continue
                    }
                    rtn.append((r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Element) )
                }
                return rtn
        }
    }
}

// MARK: - SCArray Implementations
extension SCArray: ReEncapsulatableCollecton {
    internal func reencapsulatable(dictionariesTo: ReEncapsulatableDictionaries, arraysTo: ReEncapsulatableArrays) -> Any {
        
        switch arraysTo {
            case .array:
                var rtn = Array<Element>()
                for e in self {
                    guard let r = e as? ReEncapsulatableCollecton else {
                        rtn.append(e)
                        continue
                    }
                    rtn.append((r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Element) )
                }
                return rtn
            case .classArray:
                let rtn = SCArray<Element>()
                for e in self {
                    guard let r = e as? ReEncapsulatableCollecton else {
                        rtn.append(e)
                        continue
                    }
                    rtn.append((r.reencapsulatable(dictionariesTo: dictionariesTo, arraysTo: arraysTo) as! Element) )
                }
                return rtn
        }
    }
}
