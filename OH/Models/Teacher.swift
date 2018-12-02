//
//  Teacher.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

//enum TeacherType: String, Codable {
//    case instructor = "instructor"
//    case ta = "ta"
//}
struct Instructor: Codable {
    var firstName: String
    var lastName: String
    var netid: String
//    var location: String
    
    init(name: String, netid: String) {
        
        self.firstName = name.components(separatedBy: " ")[0]
        self.lastName = name.components(separatedBy: " ")[1]
        self.netid = netid
//        self.location = location
    }
}

struct Ta: Codable {
    var subject: String
    var catalogNbr: String
    var firstName: String
    var lastName: String
    var netid: String
    var email: String
    var location: String
}

