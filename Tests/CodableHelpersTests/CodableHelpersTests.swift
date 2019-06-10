import XCTest
import Nillable
@testable import CodableHelpers

extension String: Error { }
final class CodableHelpersTests: XCTestCase {
    struct Name {
        let firstName: String
        let lastName: String
    }
    enum Gender: String, Codable {
        case male = "m"
        case female = "f"
        case other = "o"
    }
    struct SubPersonObject: Codable {
        private enum CodingKeys: CodingKey {
            case valA
            case valB
            case valC
        }
        let valA: Bool
        let valB: String?
        let valC: Int
        
        public init(valA: Bool, valB: String?, valC: Int) {
            self.valA = valA
            self.valB = valB
            self.valC = valC
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.valA = try container.decode(Bool.self, forKey: .valA)
            self.valB = try container.decodeIfPresent(String.self, forKey: .valB)
            //self.valB = try container.decode(String.self, forKey: .valB)
            self.valC = try container.decode(Int.self, forKey: .valC)
            //print("SubPersonObject.init(from:) - \(container.codingPath.stringPath)")
            let _ = true
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.valA, forKey: .valA)
            try container.encodeIfPresent(self.valB, forKey: .valB)
            try container.encode(self.valC, forKey: .valC)
            //print("SubPersonObject.encode(to:) - \(container.codingPath.stringPath)")
            let _ = true
        }
        
    }
    struct Person: Codable {
        let name: Name
        let age: Int
        let gender: Gender
        let subItems: SubPersonObject
    }
    
    struct CodableSequenceArray: CodableSequenceDynamicKeyHelper {
        static var ElementKey: String = "name"
        
        private var ary: [Person] = []
        
        public init() { }
        
        public mutating func append(_ element: Person) { self.ary.append(element) }
        
        init<S>(_ s: S) where S : Sequence, CodableHelpersTests.Person == S.Element {
            self.ary.append(contentsOf: s)
        }
        
       public func makeIterator() -> Array<Person>.Iterator {
            return ary.makeIterator()
        }
        
        public mutating func sort() {
            self.ary.sort()
        }
        
    }
    
    func testCodingCustomSequence() {
        let p1 = Person(name: "Person A", age: 36, gender: .male, subItems: SubPersonObject(valA: true, valB: "Test 1", valC: 1))
        let p2 = Person(name: "Person B", age: 30, gender: .female, subItems: SubPersonObject(valA: false, valB: nil, valC: 2))
        
        var ary: CodableSequenceArray = CodableSequenceArray()
        //var ary: Array<Person> = Array<Person>()
        ary.append(p1)
        ary.append(p2)
        ary.sort()
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let d = try encoder.encode(ary)
            #if verbose
            let s = String(data: d, encoding: .utf8)!
            print(s)
            #endif
            
            let decoder = JSONDecoder()
            var r = try decoder.decode(CodableSequenceArray.self, from: d)
            r.sort()
            #if verbose
            print(r)
            #endif
            
            if !(ary == r) {
                #if verbose
                print("----------------------------")
                print("----------------------------")
                print(ary)
                print("----------------------------")
                print(r)
                #endif
                XCTFail("Arrays do no match")
            }
            
        } catch {
            XCTFail("\(error)")
        }
        
    }
    
    func testCodingArray() {
        let p1 = Person(name: "Person A", age: 36, gender: .male, subItems: SubPersonObject(valA: true, valB: "Test 1", valC: 1))
        let p2 = Person(name: "Person B", age: 30, gender: .female, subItems: SubPersonObject(valA: false, valB: nil, valC: 2))
        
        var ary: [Person] = [p1, p2]
        ary.sort()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let d = try CodableHelpers.sequences.dynamicElementEncoding(ary,
                                                                        to: encoder,
                                                                        usingKey: "name")
            //let d = try encoder.encode(ary)
            #if verbose
            let s = String(data: d, encoding: .utf8)!
            print(s)
            #endif
            
            let decoder = JSONDecoder()
            
            //var r = try decoder.decode(CodableSequenceArray.self, from: d)
            var r = try CodableHelpers.sequences.dynamicElementDecoding(from: decoder,
                                                                        withData: d,
                                                                        usingKey: "name",
                                                                        ofType: Person.self)
            r.sort()
            #if verbose
            print(r)
            #endif
            
            if !(ary == r) {
                #if verbose
                print("----------------------------")
                print("----------------------------")
                print(ary)
                print("----------------------------")
                print(r)
                #endif
                XCTFail("Arrays do no match")
            }
            
        } catch {
            XCTFail("\(error)")
        }
        
    }
    
    func testSwiftDictionaryCoding() {
        
        
        do {
            
            var origionalDictionary = Dictionary<String, Any>()
            origionalDictionary["Person A"] = "Name A"
            origionalDictionary["Person B"] = "Name B"
            origionalDictionary["Person C"] = ["First Name", "Last Name"]
            origionalDictionary["Person D"] = Optional<Float>(3.0)
            origionalDictionary["Person D"] = true
            
            #if verbose
            print(origionalDictionary)
            #endif
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            
            
            let d = try CodableHelpers.dictionaries.encode(origionalDictionary, to: encoder)  //try encoder.encode(origionalStringDictionary)
            
            #if verbose
            let s = String(data: d, encoding: .utf8)!
            print(s)
            #endif
            
            
            
            
            let decoder = JSONDecoder()
            
            let decodedDict: Dictionary<String, Any> = try CodableHelpers.dictionaries.decode(d, from: decoder)
            
            #if verbose
            print(decodedDict)
            #endif
            
        } catch {
             XCTFail("\(error)")
        }
        
        
        do {
            
            var origionalDictionary = Dictionary<Int, Any>()
            origionalDictionary[1] = "Name A"
            origionalDictionary[2] = AnyNil
            origionalDictionary[3] = "Name B"
            
            #if verbose
            print(origionalDictionary)
            #endif
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let d = try CodableHelpers.dictionaries.encode(origionalDictionary, to: encoder)  //try encoder.encode(origionalIntDictionary)
            
            #if verbose
            let s = String(data: d, encoding: .utf8)!
            print(s)
            #endif
            
            
            let decoder = JSONDecoder()
            
            let decodedDict: Dictionary<String, Any> = try CodableHelpers.dictionaries.decode(d, from: decoder)
            
            #if verbose
            print(decodedDict)
            #endif
            
            
        } catch {
            XCTFail("\(error)")
        }
    }


    static var allTests = [
        ("testCodingCustomSequence", testCodingCustomSequence),
        ("testCodingArray", testCodingArray),
        ("testSwiftDictionaryCoding", testSwiftDictionaryCoding)
    ]
}

extension CodableHelpersTests.Name: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let n = value.split(separator: " ")
        let f = String(n[0])
        var l = ""
        if n.count > 1 { l = String(n[1]) }
        self.init(firstName: f, lastName: l)
    }
}

extension CodableHelpersTests.Name: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let s = try container.decode(String.self)
        self.init(stringLiteral: s)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.firstName + " " + self.lastName)
    }
}

extension CodableHelpersTests.Name: Comparable {
    public static func == (lhs: CodableHelpersTests.Name, rhs: CodableHelpersTests.Name) -> Bool {
        return ((lhs.firstName == rhs.firstName) && (lhs.lastName == rhs.lastName))
    }
    public static func < (lhs: CodableHelpersTests.Name, rhs: CodableHelpersTests.Name) -> Bool {
        return (lhs.firstName + " " + lhs.lastName) < (rhs.firstName + " " + rhs.lastName)
    }
}

extension CodableHelpersTests.SubPersonObject: Equatable {
    public static func == (lhs: CodableHelpersTests.SubPersonObject, rhs: CodableHelpersTests.SubPersonObject) -> Bool {
        return ((lhs.valA == rhs.valA) && (lhs.valB == rhs.valB) && (lhs.valC == rhs.valC))
    }
}

extension CodableHelpersTests.Person: Comparable {
    public static func == (lhs: CodableHelpersTests.Person, rhs: CodableHelpersTests.Person) -> Bool {
        return ((lhs.age == rhs.age) && (lhs.gender == rhs.gender) && (lhs.name == rhs.name) && (lhs.subItems == rhs.subItems))
    }
    public static func < (lhs: CodableHelpersTests.Person, rhs: CodableHelpersTests.Person) -> Bool {
        return (lhs.name < rhs.name)
    }
}

extension CodableHelpersTests.CodableSequenceArray: Equatable {
    public static func == (lhs: CodableHelpersTests.CodableSequenceArray, rhs: CodableHelpersTests.CodableSequenceArray) -> Bool {
        return lhs.ary == rhs.ary
    }
}
