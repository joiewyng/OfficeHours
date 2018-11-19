//
//  Course.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import Foundation

struct Course{
    var name: String
    var abbrv: String
    var instructors: [Teacher]
    
    init(name: String, abbrv: String, instructors: [Teacher]) {
        self.name = name
        self.abbrv = abbrv
        self.instructors = instructors
    }
}
