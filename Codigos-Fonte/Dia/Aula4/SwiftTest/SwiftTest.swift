//
//  SwiftTest.swift
//  SwiftTest
//
//  Created by João Paulo Scopus on 24/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import XCTest

struct Movie {
    let director: String
    let title: String
}

class StructTest: XCTestCase {
    
    func testStruct(){
        let movie = Movie(director: "Fulano", title: "A morte da bizerra")
        
        XCTAssertEqual(movie.title, "A morte da bizerra")
        
    }
}


















