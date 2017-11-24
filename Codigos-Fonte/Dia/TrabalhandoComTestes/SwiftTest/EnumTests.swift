//
//  EnumTests.swift
//  SwiftTest
//
//  Created by João Paulo Scopus on 24/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import XCTest

enum HttpResult {
    case Success([String: Any])
    case Failure(String)
}

enum Color: String {
    case Red = "Vermelho"
    case Blue = "Azul"
    case Green = "Verde"
    case Yellow = "Amarelo"
    case Unknown = "Não Encontrado"

    var description: String {
        switch self {
        case .Blue:
            return "Azul"
        case .Green:
            return "Verde"
        case .Red:
            return "Vermelho"
        case .Yellow:
            return "Amarelo"
        default:
            return "Not found"
        }
    }
}

class EnumTests: XCTestCase {
    
    func testColor() {
        let cor = Color.Red
        XCTAssertEqual(cor.description, Color.Red.rawValue)
        //XCTAssertEqual(Color.Red, Color(rawValue: "r"))
    }
    
    func testEnumHttpSuccess(){
        
        func validaRetorno(result: HttpResult){
            switch result {
            case .Success(let x):
                XCTAssertNotNil(x["200"])
            case .Failure(let message) where message.isEmpty:
                XCTAssertTrue(message.isEmpty)
            case .Failure(let message):
                XCTAssertNotNil(message)
            default:
                break
            }
        }
        
        let result1 = HttpResult.Success(["200": "Success"])
        validaRetorno(result: result1)
        let result2 = HttpResult.Failure("Falha1")
        validaRetorno(result: result2)
        let result3 = HttpResult.Failure("")
        validaRetorno(result: result3)
        
    }
}
