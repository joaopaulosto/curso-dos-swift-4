//
//  Task.swift
//  TrabalhandoComRest
//
//  Created by João Paulo Scopus on 06/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation

public struct Task {
    var id: String
    var expirate_data: Date
    var title: String
    var description: String
    var is_complete: Bool
    var owner: String
}
