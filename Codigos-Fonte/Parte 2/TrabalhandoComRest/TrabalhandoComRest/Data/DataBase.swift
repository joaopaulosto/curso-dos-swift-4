//
//  DataBase.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 07/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import RealmSwift

class DataBase{
    
    let realm = try! Realm()
    
    public func save(obj: TokenEnty){
        try! realm.write {
            realm.add(obj)
        }
    }
    public func delete(obj: TokenEnty){
        
    }
    public func findById(id: String) -> TokenEnty?{
        let result = realm.objects(TokenEnty.self).filter("id == '\(id)'")
        return result.first
    }
}
