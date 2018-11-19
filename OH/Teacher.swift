//
//  Teacher.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

enum TeacherType {
    case instructor
    case ta
}
struct Teacher {
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

