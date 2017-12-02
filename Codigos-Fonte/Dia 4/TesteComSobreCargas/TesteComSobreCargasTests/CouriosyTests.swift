//
//  CouriosyTests.swift
//  TesteComSobreCargasTests
//
//  Created by João Paulo Scopus on 27/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import XCTest

class PropertyObservors{
    var test = 0
    var value = 0 {
        willSet(valorRecebido) {
            print("Setou + 1 no willset")
            test+=1
        }
        didSet {
            print("Setou + 2")
            test += 2
        }
    }
}

class CouriosyTests: XCTestCase {
    
    func testFloat(){
        
        var i: Int = 0
        for _ in  stride(from: 0.5, to: 2.5, by: 0.5){
            i += 1
        }
        XCTAssertEqual(i, 4)
        
    }
    
    func testPropertyObserver(){
        
        let v = PropertyObservors()
        v.value = 1
        XCTAssertEqual(v.test, 3)
    }
    
}
