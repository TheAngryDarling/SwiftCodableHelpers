# Codable Helpers
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)
![Swift](https://img.shields.io/badge/Swift->=4.0-green.svg?style=flat)

NOTE: This package is no longer being updated.  Its been broken out into three separate smaller packages, [Basic Codable Helpers](https://github.com/TheAngryDarling/SwiftBasicCodableHelpers), [Advanced Codable Helpers](https://github.com/TheAngryDarling/SwiftAdvancedCodableHelpers), and [Custom Coders](https://github.com/TheAngryDarling/SwiftCustomCoders), so that developers only need to include the package of the code they really need and not add a bunch of extra code that would not be used.

Helper classes, protocols and functions designed to make more complex encoding/decoding easier.

### Helper Containers

#### Bridged

Allows for bridging between different CodingKeys

* **BridgedKeyedDecodingContainer**
* **BridgedKeyedEncodingContainer**

#### Delayed

Allows the developer to delay the real encoding process until they decide to

* **DelayedEncoder**
* **DelayedKeyedEncodingContainer**
* **DelayedUnkeyedEncodingContainer**
* **DelayedSingleValueEncodingContainer**

#### Filtered

Allows the developer to filter objects out from being writting to the encoder

* **FilteredKeyedEncodingContainer**
* **FilteredUnkeyedEncodingContainer**

#### FilteredDelayed

Is a combination of filtered and delayed.  These are good for moving properties around

* **FilteredDelayedEncoder**
* **FilteredDelayedKeyedEncodingContainer**
* **FilteredDelayedUnkeyedEncodingContainer**
* **FilteredDelayedSingleValueEncodingContainer**

#### Injected

Allows the developer to add in objects to the decoding process

* **InjectedKeyedDecodingContainer**
* **InjectedSingleValueDecodingContainer**
* **InjectedUnkeyedDecodingContainer**
* **WrappedInjectedKeyedDecodingContainer**

### Helper Coders

Used to calling new coder processing withing an already coding process.  They wrap the current container into a coder object for use on the encode(to:) and the init(from:)

* **WrappedKeyedDecoder**
* **WrappedKeyedEncoder**
* **WrappedSingleValueDecoder**
* **WrappedSingleValueEncoder**
* **WrappedUnkeyedDecoder**
* **WrappedUnkeyedEncoder**

#### Custom CodingPath Wrappers

Used to change the outward looking codingPath on objects.  This is helpful when manipulating the coding path on the fly

* **WrappedKeyedDecodingContainer**
* **WrappedUnkeyedDecodingContainer**
* **WrappedKeyedEncodingContainer**
* **WrappedUnkeyedEncodingContainer**
* **WrappedSingleValueDecodingContainer**
* **WrappedSingleValueEncodingContainer**
* **WrappedDecoder**
* **WrappedEncoder**

### Helper Catchers

Catches either the Encoder or Decoder for use outside the normal coding process

* **EncoderCatcher**
* **DecoderCatcher**

### Coders

* **BasicOpenEncoder** - The base class for custom encoders.  This requires the the inherited class provide a method that takes in the in-memory encoding (single value, array, dictionary) that as been done and transforms it into the wanted results.  The encode method takes in any Encodable object
* **BasicOpenDecoder** - The base class for custom decoders. This requires that the inherited class provides a method that takes in the encoded input and returns the in-memory results (single value, array, dictionary).  The decode method return any Decodable object
* **BasicSemiClosedEncoder** - The base class for semi-closed custom encoders.  This requires the the inherited class provide a method that takes in the in-memory encoding (single value, array, dictionary) that as been done and transforms it into the wanted results.  The encode method takes in a specific object type
* **BasicSemiClosedDecoder** - The base class for closed custom decoders. This requires that the inherited class provides a method that takes in the encoded input and returns the in-memory results (single value, array, dictionary).  The decode method return a specific object type
* **BasicClosedEncoder** - The base class for closed custom encoders.  This requires the the inherited class provide a method that takes in the in-memory encoding (single value, array, dictionary) that as been done and transforms it into the wanted results.  The encode method takes in a specific object type
* **BasicClosedDecoder** - The base class for closed custom decoders. This requires that the inherited class provides a method that takes in the encoded input and returns the in-memory results (single value, array, dictionary).  The decode method return a specific object type
* **SimpleEncoder** - A simple class that allows for a developer to convert and object into its in-memory equivalent
* **PListEncoder/PListDecoder** - Custom Encoder/Decoder for Property Lists.  When not building on an ObjectC runtime (Non Apple device) type aliases are setup for PropertyListEncoder/PropertyListDecoder to the equivilant PList object

### Helpers

* **CodableKey** - A basic CodingKey that takes in any value.  Its good for using dynamic keys.
* **CodableHelper** - Where helper methods are located
    * **sequences** - Where sequence related helper methods are located
        * **dynamicElementEncoding** - Encodes an array like a dictionary based on a property in the object type
            * **Notes**
                * Array order is not guaranteed
                * CodingPath when encoding will be malformed.  The Dynamic Key will be missing
        * **dynamicElementDecoding** - Decodes a dictionary into an array moving the key to a specific property named value 
            * **Notes**
                * Array order is not guaranteed
                * CodingPath when decoding will be malformed.  The Dynamic Key will be missing
    * **arrays** - Where array related encode/decode helper methods are located
        * **Notes**
            * When working with numeric values with, if the decimal portion is Zero, the encoder will cut it down to an Int, and the decoder will then read it as an Int
            *  When working with Bools stored in Any, on Linux Swift versions 4.0-4.0.3 when decoding they convert to Int.  This is an issue with the JSONDecoder.  It works correctly in 4.2.
    * **dictionaries** - Where dictionary related encode/decode helper methods are located
       * **Notes** 
            * When working with numeric values with, if the decimal portion is Zero, the encoder will cut it down to an Int, and the decoder will then read it as an Int
            * When working with Bools stored in Any, on Linux Swift versions 4.0-4.0.3 when decoding they convert to Int.  This is an issue with the JSONDecoder.  It works correctly in 4.2.


### Protocols

* **CodableSequenceDynamicKeyHelper** - A protocol used on types that implement Sequence that provide the necessary logic to encode into dictionaries based on a specific property name and decode back into an sequence.  This protocol relies on the dynamicElementEncoding and dynamicElementDecoding methods
* **BaseEncoderTypeBoxing** - A protocol for defining the type boxing methods used by the encoders.  Allows for overriding the value being encoding
* **BaseDecoderTypeUnboxing** - A protocol for defining the type unboxing methods used by decoders.  Allows for overriding the value being decoded

### Choice Enums

* **EncoderChoice** - Provides a programmatic way of choosing which encoder to use. This is nice when providing end users with the choice of what type file to encode to
  * **xmlPList** - Use PropertyListEncoder or PListEncoder for xml depending on platform
  * **binaryPList** - Use PropertyListEncoder or PListEncoder for binary depending on platform
  * **json** - Use the standard JSONEncoder
  * **other** - You can specify your own instance of an encoder

* **DecoderChoice** - Provides a programmatic way of choosing which decoder to use.
  * **plist** -  Use PropertyListDecoder or PListDecoder depending on platform
  * **json** - If swift < 4.2 and BasicDecoderChoice.usePatchedJSONDecoder enabled, will use BasicCodableHelperPatchedJSONDecoder otherwise will use standard JSONDecoder
  * **other** - You can specify your own instance of a decoder

## Usage

Object:
```swift
public struct Person {
    let name: String
    let age: Int
}
// Implement Codable on Person
extension Person: Codable {
    ...
}

// Custom Sequence that contains Person objects
public struct PersonSequence: MutableCollection, Codable {
    public typealias Element = Person
    static var ElementKey: String = "name"

    // rest of code to setup this as a MutableCollection
    ...
}
```

Simple Array Coding:
```swift
import CodableHelpers
// Setup array
let array: [Person] = [Person(name: "Person A", age: 36),
                       Person(name: "Person B", age: 30)]

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
// Encode the array
let d = try CodableHelpers.sequences.dynamicElementEncoding(ary,
                                                            to: encoder,
                                                            usingKey: "name")
let s = String(data: d, encoding: .utf8)!
print(s)

let decoder = JSONDecoder()
// Decode the array
let r = try CodableHelpers.sequences.dynamicElementDecoding(from: decoder,
                                                            withData: d,
                                                            usingKey: "name",
                                                            ofType: Person.self)
print(r)
```

Custom Sequence Coding:
```swift
import CodableHelpers
// Setup sequence
let p1 = Person(name: "Person A", age: 36)
let p2 = Person(name: "Person B", age: 30)

var array: PersonSequence = PersonSequence()
array.append(p1)
array.append(p2)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
// Encode the sequence
let d = try encoder.encode(ary)
let s = String(data: d, encoding: .utf8)!
print(s)
            
let decoder = JSONDecoder()
// Decode the sequence
let r = try decoder.decode(PersonSequence.self, from: d)
print(r)
```

## Dependencies

* **[Basic Codable Helpers](https://github.com/TheAngryDarling/SwiftBasicCodableHelpers.git)** - Package that provides basic helper methods on Encoder and Decoder containers
* **[Nillable](https://github.com/TheAngryDarling/SwiftNillable.git)** - Package used to identify nil/NSNull objects when stored in Any format
* **[SwiftClassCollection](https://github.com/TheAngryDarling/SwiftClassCollections.git)** - Package used to work with swift class based collections that are equivalent to Array and Dictionary

## Author

* **Tyler Anger** - *Initial work* - [TheAngryDarling](https://github.com/TheAngryDarling)

## License

This project is licensed under Apache License v2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Based on and in some cases copied/modified from [Swift Source Code](https://github.com/apple/swift/blob/master/stdlib/public/core/Codable.swift.gyb) to ensure similar standards when dealing with encoding/decoding.
