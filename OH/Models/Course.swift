//
//  Course.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

struct CourseSearchResponse : Codable {
    var data: CourseDataResponse
}

struct CourseDataResponse: Codable {
    var classes: [Course]
}

struct Course: Codable {
    var titleLong: String  // course complete name
    var subject: String    // INFO, CS, ...
    var catalogNbr: String  // 2110, ...
    var enrollGroups: [EnrollGroupsData]
    
    init(titleLong: String, subject: String, catalogNbr: String, instructors: [Instructor]) {
        self.titleLong = titleLong
        self.subject = subject
        self.catalogNbr = catalogNbr
        self.enrollGroups = [EnrollGroupsData(classSections: [Section(meetings: [Meeting(instructors: instructors)])])]
    }
}

struct EnrollGroupsData: Codable {
    var classSections: [Section]
    
    init(classSections: [Section]) {
        self.classSections = classSections
    }
}

struct Section: Codable {
    var meetings: [Meeting]
    
    init(meetings: [Meeting]) {
        self.meetings = meetings
    }
}
struct Meeting: Codable {
    var instructors: [Instructor]
    
    init(instructors: [Instructor]) {
        self.instructors = instructors
    }
}
