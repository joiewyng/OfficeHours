//
//  CalendarViewController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var courseTableView: UITableView!
    let titleLabel: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hard-code course list
        var course1 = Course(name: "Rapid Prototyping and Physical Computing", abbrv: "INFO4320", instructors)
        var course2 = Course(name: "Object-Oriented Programming and Data Structures", abbrv: "CS2110", instructors: instructors)
        
        courseTableView = UITableView(frame: .zero, style: .grouped)
        courseTableView.dataSource = self
        courseTableView.delegate = self
        view.addSubview(courseTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
