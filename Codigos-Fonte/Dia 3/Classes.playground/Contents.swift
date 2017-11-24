//: Playground - noun: a place where people can play

import UIKit

class Movie {
    var title: String
    let director: String
    var durationInMinute: Double = Movie.defaultMovieMinutos
    static let defaultMovieTitle = "Um filme qualquer"
    static let defaultMovieDirector = "Uma pessoa qualquer"
    static let defaultMovieMinutos: Double = 120.0
    
    //Metodo Statico
    static func printDefaultMovieTitle(){
        print(Movie.defaultMovieTitle)
    }
    
    //Computer propertie
    var description: String {
        return "\(self.title): \(self.director)"
    }
    
    var durationInHours: Double {
        get {
            return self.durationInMinute / 60
        }
        set (valorRecebido) {
            self.durationInMinute  = valorRecebido * 60
        }
    }
    
    //Disigneted Initinializer
    init(_ title: String, _ director: String) {
        self.director = director
        self.title = title
        self.durationInMinute = Movie.defaultMovieMinutos
        
    }
    
    convenience init(_ title: String, _ director: String, _ durationMinutes: Int) {
        self.init(title, director)
        self.durationInMinute = durationInHours
    }
    
    deinit {
        print("Estou sendo destruindo")
    }
    
    convenience init() {
        self.init(Movie.defaultMovieTitle)
    }
    
    convenience init(_ title: String) {
        self.init(title, Movie.defaultMovieDirector)
    }
}

var filme = Movie("Os corajoses", "I don't no")

var outroFilme: Movie? = Movie("Tropa de Elite", "José Padilha", 120)
outroFilme?.durationInHours

outroFilme === outroFilme
filme === outroFilme
outroFilme = nil


class FigthMovie: Movie {
    
    var boodLevel: Int

    /*
    convenience override init(_ level: Int) {
        self.boodLevel = level
        super.init(Movie.defaultMovieTitle, Movie.defaultMovieDirector, Movie.defaultMovieMinutos)

    }
    
    override var description: String {
        return "\(self.title) :  \(self.description)  \(self.durationInHours) \(self.boodLevel)"
    } */
    
}



