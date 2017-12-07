//
//  Entities.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 07/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import RealmSwift

class TokenEnty: Object {
    
    @objc dynamic var id: String = "1"
    @objc dynamic var scope: String? = ""
    @objc dynamic var accessToken: String? = ""
    @objc dynamic var expiresIn: Int = 0
    @objc dynamic var refreshToken: String? = ""
}
