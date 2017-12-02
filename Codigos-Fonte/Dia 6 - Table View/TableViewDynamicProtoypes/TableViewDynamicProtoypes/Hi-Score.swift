//
//  Hi-Score.swift
//  TableViewDynamicProtoypes
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

public extension Int {
    public var asWord: String {
        let numberValue = NSNumber(value: self)
        var formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: numberValue)!
    }
}

class Hi🕹Score: NSObject {
    
    var nome: String = ""
    var 🏅: Int = 0
    
    
    init(name: String, 🏅: Int) {
        self.nome = name
        self.🏅 = 🏅
        
    }
    
    static func criarListaScore(qtde: Int) -> [Hi🕹Score]{
        var list = [Hi🕹Score]()
        for i in 1...qtde{
            let diceRoll = Int(arc4random_uniform(UInt32(qtde * 100)))
            let play = Hi🕹Score(name: "\(diceRoll.asWord)", 🏅: i * diceRoll)
            list.append(play)
        }
        return list
    }

}
