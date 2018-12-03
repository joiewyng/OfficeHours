//
//  CourseOfficeHours.swift
//  OH
//
//  Created by Joie Ng on 12/2/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

struct CourseOHSearchResponse : Codable {
    var data: [OfficeHour]
}


struct OfficeHour: Codable {
    var oh_id: String  // course complete name
    var expert_name: String    // INFO, CS, ...
    var expert_type: String  // 2110, ...
    var start_time: String
    var end_time: String
    var days: [Bool]
    var location: String
//
//    init(oh_id: String, expert_name: String, expert_type: String, start_time: String, end_time: String, days: [Bool], location: String {
//        self.oh_id = titleLong
//        self.subject = subject
//        self.catalogNbr = catalogNbr
//        self.enrollGroups = [EnrollGroupsData(classSections: [Section(meetings: [Meeting(instructors: instructors)])])]
//    }
}
