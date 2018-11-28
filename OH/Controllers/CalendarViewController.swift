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
    
    var sampleButton: UIButton!
    
    let reuseIdentifier = "courseCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Office Hour"
        
        titleLabel = UILabel()
        titleLabel.text = "please show up"
        view.addSubview(titleLabel)
        
        sampleButton = UIButton()
        sampleButton.setTitleColor(.gray, for: .normal)
        sampleButton.backgroundColor = .white
        sampleButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        sampleButton.setTitle("Button", for: .normal)
        view.addSubview(sampleButton)
        
        getCourses()
        
        tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseTableCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        
    
        setupConstraints()
    }
    
    func getCourses() {
        // hard-code course list
        let teacher1 = Teacher(type: .instructor, name: "François Guimbretière", email: "francois@cornell.edu", location: "241 Gates Hall")
        let teacher2 = Teacher(type: .instructor, name: "D. Gries", email: "dgries@cornell.edu", location: "185-Aud Statler Hall")
        let course1 = Course(name: "Rapid Prototyping and Physical Computing", abbrv: "INFO4320", instructors:[teacher1])
        let course2 = Course(name: "Object-Oriented Programming and Data Structures", abbrv: "CS2110", instructors: [teacher2])
        courseList = [course1, course2]
    }
    
    func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.leading.trailing.bottom.equalToSuperview()
//            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        titleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(200)
        }
        sampleButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(240)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CourseTableCell
        let course = courseList[indexPath.row]
        cell.configure(for: course)
        cell.selectionStyle = .none
//        cell.needsUpdateConstraints()
        return cell
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func pressed() {
        if (sampleButton.isSelected) {
            sampleButton.backgroundColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
            sampleButton.setTitleColor(.white, for: .selected)
            sampleButton.setTitle("selected!", for: .selected)
        } else {
            sampleButton.backgroundColor = .white
            sampleButton.setTitleColor(.gray, for: .normal)
        }
    }
    

}
