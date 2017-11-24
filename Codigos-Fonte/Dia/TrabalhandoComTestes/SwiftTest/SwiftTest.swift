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
    
    init(){
        self.director = "Diretor"
        self.title = "Filme"
    }
    
    init( title: String, director: String ) {
        self.director = director
        self.title = title
    }
    
    init?(dictonary: [String: String]){
        self.title = dictonary["title"] ?? "Titulo"
        self.director = dictonary["director"] ?? "Diretor"
    }
}

class MovieC {
    var titleClass: String
    var director: String
    
    convenience init() {
        self.init(title: "Titulo", director: "Diretor")
    }
    
    init(title: String, director: String) {
        self.titleClass = title
        self.director = director
    }
}

typealias MovieS = Movie

class StructTest: XCTestCase {
    
    func testStruct(){
      
        let movie = Movie(title: "A morte da bizerra", director: "Fulano")
        XCTAssertEqual(movie.title, "A morte da bizerra")
        
        guard Movie(dictonary: ["title": "Lagoa Azul", "director1": "um cara ai"]) != nil else {
            XCTFail("Falha ao criar Movie")
            return
        }
    }
    func testStructVsClass() {
        let movieS = MovieS(title: "Até o último homem", director: "XPTO Produções")
        let movieC = MovieC(title: "Até o último homem", director: "XPTO Produções")
        
        func mostarTitle(movie: Any) -> String?{
            
            if let m = movie as? MovieS{
                return m.title
            }
            if let m = movie as? MovieC {
                return m.titleClass
            }
            return nil
            
            /*
            if movie is MovieS {
               return (movie as! MovieS).title
            }else if movie is MovieC {
               return (movie as! MovieC).titleClass
            }
            return nil */
        }
        print("Movie S: \(mostarTitle(movie: movieS)!))")
        print("Movie C: \(mostarTitle(movie: movieC)!))")
        
    }
    
}



















