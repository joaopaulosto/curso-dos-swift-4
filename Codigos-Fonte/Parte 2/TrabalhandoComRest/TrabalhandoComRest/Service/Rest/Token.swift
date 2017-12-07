//
//  Token.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import Genome
import EasyRest

class Token: BaseModel {
    var scope: String?
    var accessToken: String?
    var expiresIn: Int?
    var refreshToken: String?
    
    required init() { super.init() }
    
    override func sequence(_ map: Map) throws {
        try scope <~> map["scope"]
        try accessToken <~> map["access_token"]
        try expiresIn <~> map["expires_in"]
        try refreshToken <~> map["refresh_token"]
    }
}

