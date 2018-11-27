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

    var tableView: UITableView!
    var titleLabel: UILabel!
    var courseList: [Course]!
    
    let reuseIdentifier = "courseCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Office Hour"
        
        titleLabel = UILabel()
        titleLabel.text = "please show up"
        
        view.addSubview(titleLabel)
        
        // hard-code course list
        var teacher1 = Teacher(type: .instructor, name: "François Guimbretière", email: "francois@cornell.edu", location: "241 Gates Hall")
        var teacher2 = Teacher(type: .instructor, name: "D. Gries", email: "dgries@cornell.edu", location: "185-Aud Statler Hall")
        var course1 = Course(name: "Rapid Prototyping and Physical Computing", abbrv: "INFO4320", instructors:[teacher1])
        var course2 = Course(name: "Object-Oriented Programming and Data Structures", abbrv: "CS2110", instructors: [teacher2])
        courseList = [course1, course2]
        
        tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseTableCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
    
        setupConstraints()
    }
    
    func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(200)
//            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        titleLabel.snp.makeConstraints{make in
            make.top.equalTo(self.view.snp.top).offset(200)
        }
//        loginButton.snp.makeConstraints { make in
//
//            make.height.equalTo(48)
//            make.width.equalTo(200)
//            make.bottom.equalTo(self.view.snp_bottom).offset(-200)
//            make.centerX.equalToSuperview()
//        }
//
//        appNameLabel.snp.makeConstraints { make in
//
//            make.height.equalTo(70)
//            make.width.equalTo(200)
//            make.bottom.equalTo(self.view.snp_bottom).offset(-600)
//            make.centerX.equalToSuperview()
//        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CourseTableCell
        let course = courseList[indexPath.row]
        cell.configure(course: course)
        cell.selectionStyle = .none
        cell.needsUpdateConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
