//
//  DetailsViewController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    var courseNameLabel: UILabel!
    var typeLabel1: UILabel!
    var typeLabel2: UILabel!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var locationLabel: UILabel!
    var tableView: UITableView!
    
    var course: Course!
    var professors: [Instructor]!
    var tas: [Ta]!
    let sections = ["Instructor", "TA"]
    
    let padding: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = course.titleLong
        
        courseNameLabel = UILabel()
        courseNameLabel.text = "\(course.subject) \(course.catalogNbr) \(course.titleLong)"
        courseNameLabel.textColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        courseNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
        courseNameLabel.numberOfLines = 2
        view.addSubview(courseNameLabel)
        
        professors = course.enrollGroups[0].classSections[0].meetings[0].instructors
        
        
        tas = []
        
        tableView = UITableView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        courseNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(padding*3)
            make.trailing.equalToSuperview().offset(padding*(-3))
        }
        tableView.snp.remakeConstraints{ make in
            make.top.equalTo(courseNameLabel.snp.bottom).offset(padding*2)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName = "Instructor"
        case 1:
            sectionName = "TA"
        default:
            sectionName = ""
        }
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return professors.count
        } else if section == 1 {
            return tas.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        var instructor: Instructor!
        var ta: Ta!
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)

        emailLabel = UILabel()
        emailLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)

        locationLabel = UILabel()
        locationLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
        
        if indexPath.section == 0 {
            instructor = professors[indexPath.row]
            nameLabel.text = "\(instructor.firstName) \(instructor.lastName)"
            emailLabel.text = "\(instructor.netid)@cornell.edu"
//            locationLabel.text = instructor.location
        } else if indexPath.section == 1 {
            ta = tas[indexPath.row]
        }
//        cell.textLabel?.text = "\(instructor.name)"
        
        cell.addSubview(nameLabel)
        cell.addSubview(emailLabel)
//        cell.addSubview(locationLabel)
        setupCellConstraints()
        return cell
    }
    
    func setupCellConstraints() {
        nameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(padding*2)
            make.leading.equalToSuperview().offset(padding*3)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(padding*2)
            make.leading.equalToSuperview().offset(padding*3)
        }
//        locationLabel.snp.makeConstraints { make in
//            make.top.equalTo(emailLabel.snp.bottom).offset(padding*2)
//            make.leading.equalToSuperview().offset(padding*3)
//        }
    }
}

