//
//  Task.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 07/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import Genome
import EasyRest

public class TaskParent: BaseModel {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [TaskRest] = []
    
    
    override public func sequence(_ map: Map) throws {
        try count <~> map["count"]
        try next <~> map["next"]
        try results <~> map["results"]
    }
}

public class TaskRest : BaseModel {
    var id: String?
    var expirateData: String?
    var title: String?
    var descriptionTask: String?
    var isComplete: Bool = false
    var owner: String?
    var expiration: Date?
    
    required public init() { super.init() }
    
    override public func sequence(_ map: Map) throws {
        try id <~> map["id"]
        try expirateData <~> map["expiration_date"]
        try title <~> map["title"]
        try descriptionTask <~> map["description"]
        try isComplete <~> map["is_complete"]
    }
}

