//
//  Teacher.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

enum TeacherType: String, Codable {
    case instructor = "instructor"
    case ta = "ta"
}
struct Teacher: Codable {
    var type: TeacherType
    var name: String
    var email: String
    var location: String
    
    init(type: TeacherType, name: String, email: String, location: String) {
        self.name = name
        self.type = type
        self.email = email
        self.location = location
    }
}

