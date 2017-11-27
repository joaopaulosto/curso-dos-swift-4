//
//  ExtensionClass.swift
//  SwiftTest
//
//  Created by João Paulo Scopus on 24/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import XCTest

extension String {
    func subString(p1: UInt, p2 : UInt) throws -> String {
        
        guard p1 <= self.count && p2 <= self.count  else {
            
            throw StringError.NullPointerException(p1, p2, 10)
            
        }
        
        let d1 = String.IndexDistance(p1)
        let d2 = String.IndexDistance(p2)
        
        let i1 = self.index(self.startIndex, offsetBy: d1)
        let i2 = self.index(self.startIndex, offsetBy: d2)
    
        return String(self[i1..<i2])
    }
    
     func subString2(p1: UInt, p2 : UInt) -> String? {
        
        guard p1 <= self.count && p2 <= self.count  else { return nil}
        
        let d1 = String.IndexDistance(p1)
        let d2 = String.IndexDistance(p2)
        
        let i1 = self.index(self.startIndex, offsetBy: d1)
        let i2 = self.index(self.startIndex, offsetBy: d2)
        
        return String(self[i1..<i2])
    }
    
    static func subString(str: String, p1: UInt,  p2: UInt) -> String? {
        guard p1 <= str.count && p2 <= str.count else { return nil }
        
        let d1 = String.IndexDistance(p1)
        let d2 = String.IndexDistance(p2)
        
        let i1 = str.index(str.startIndex, offsetBy: d1)
        let i2 = str.index(str.startIndex, offsetBy: d2)
        
        return String(str[i1..<i2])
    }
    
    func subString(p1: UInt, size: UInt) -> String? {
        return self.subString2(p1: p1, p2: (p1 + size))
        
        /*
        guard _p1 < self.count && _size < self.count  else { return nil }
        
        let d1 = String.IndexDistance(_p1)
        let d2 = String.IndexDistance(_size - _p1)
        
        let i1 = self.index(self.startIndex, offsetBy: d1)
        let i2 = self.index(self.startIndex, offsetBy: d2)
        
        return String(self[i1...i2]) */
    }
    
    enum StringError: Error {
        case NullPointerException(UInt, UInt, Int)
    }
}

extension Array {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        for i in 0..<self.count {
            let random: Int = Int(arc4random_uniform(UInt32(self.count - 1)))
            self.swapAt(i, random)
        }
    }
}

class ExtensionClass: XCTestCase {
    
    func testExceptionString(){
        let str = "123456"
        do {
            let _ = try str.subString(p1: 5, p2: 100)
        } catch String.StringError.NullPointerException(let p1, let p2, let count) {
            XCTFail("Range [\(p1), \(p2) ⊄ [0, \(count)]")
        } catch {
            XCTFail("Xiiiiii")
        }
    }

    func testSubString(){
        let str = "ABCDEFGH"
        let resultado = str.subString(p1: 3, size: 5)
        XCTAssertTrue(resultado == "DEFGH")
    }
   
    func testSubStringRangeOut(){
        let valores = "012345"
        let resultado = valores.subString(p1: 1, size: 4)
        XCTAssertTrue(resultado == "1234")
    }
    
    func testSubStringStatic() {
        let str = String.subString(str: "12345678910", p1: 2, p2: 5)
        XCTAssertEqual(str, "345")
    }
    
    func testEmbaralhaArray() {
        
        var myArrayRandom = ["a", "b", "c", "d", "e", "f", "g"]
        myArrayRandom.shuffle()
        let newArray = myArrayRandom
        print(myArrayRandom)
        let result = zip(myArrayRandom, newArray).enumerated().filter(){
            $1.0 == $1.1
        }.map{$0}
    }
}
