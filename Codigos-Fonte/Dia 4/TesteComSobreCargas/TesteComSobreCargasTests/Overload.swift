//
//  Overload.swift
//  TesteComSobreCargasTests
//
//  Created by João Paulo Scopus on 27/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import XCTest
 /*
postfix operator-
infix operator x: MultiplicationPrededence
// https://developer.apple.com/documentation/swift/operator_declarations

struct Vector2D {
    var x = 0.0,
    y = 0.0
    //Binary infix operators
    static func+ (left: Vector2D, rigth: Vector2D) -> Vector2D {
        return left.x == rigth.x && left.y == rigth.y
    }
    
    static func +=(left: inout Vector2D, right: Vector2D){
        left = left + right
    }
    
    struct prefix func- (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
    static postfix func- (vector: Vector2D) -> Vector2D {
        return -vector
    }
    
    static func× (left: Vector2D, right: Vector2D) -> Double {
        return left.x * right.x + left.y * right.y
    }
}



class Overload: XCTestCase {
    
    func testVectorSum() {
        let result = Vector2D(x: 1, y: 1) + Vector2D(x: 1, y: 1)
        XCTAssert(result == Vector2D(x: 2, y: 2))
        XCTAssert(-result == Vector2D(x: -2, y: -2))
        XCTAssertEqual(Vector2D(x: 2, y: 2) × Vector2D(x: 2, y: 2), 8)
    }
}
 */
