//
//  Sayadin.swift
//  nsuserdefaults
//
//  Created by Lucas Paim on 22/11/2017.
//  Copyright © 2017 Lucas Paim. All rights reserved.
//

import Foundation


class Sayadin: NSObject, NSCoding {
    
    var name: String?
    var phrase: String?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObject(forKey: "name") as? String
        phrase = aDecoder.decodeObject(forKey: "phrase") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(phrase, forKey: "phrase")
    }
    
}


