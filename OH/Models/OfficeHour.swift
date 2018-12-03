//
//  Event.swift
//  OH
//
//  Created by Li Chai on 11/30/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

struct ProfOH: Codable {
    var instructor: Instructor
    var day: String
    var startTime: String
    var endTime: String
//    var name: String
    var location: String
    //var votes: CLong
    
    init(instructor: Instructor, day: String, startTime: String, endTime: String, location: String) {
        self.instructor = instructor
        self.day = day
        self.startTime = startTime
        self.endTime = endTime
//        self.name = name
        self.location = location
        //self.votes = votes
    }
}
struct TAOH: Codable {
    var instructor: Instructor
    var day: String
    var startTime: String
    var endTime: String
    var name: String
    var location: String
    //var votes: CLong
    
    init(instructor: Instructor, day: String, startTime: String, endTime: String, name: String, location: String) {
        self.instructor = instructor
        self.day = day
        self.startTime = startTime
        self.endTime = endTime
        self.name = name
        self.location = location
       // self.votes = votes
    }
}


