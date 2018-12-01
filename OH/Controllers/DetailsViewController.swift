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
    var course: Course!
    
    let padding: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = course.name
        
        courseNameLabel = UILabel()
        courseNameLabel.text = "\(course.abbrv) \(course.name)"
        courseNameLabel.textColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        courseNameLabel.numberOfLines = 2
        view.addSubview(courseNameLabel)
        
        for instructor in course.instructors {
            if (instructor.type == .instructor) {
                typeLabel1 = UILabel()
                typeLabel1.text = "Instructor"
                typeLabel1.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)  // dark grey
                typeLabel1.font = UIFont.systemFont(ofSize: 20)
                view.addSubview(typeLabel1)
            }
            if (instructor.type == .ta) {
                typeLabel2 = UILabel()
                typeLabel2.text = "TA"
                typeLabel2.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)  // dark grey
                typeLabel2.font = UIFont.systemFont(ofSize: 20)
                view.addSubview(typeLabel2)
            }
            nameLabel = UILabel()
            nameLabel.text = instructor.name
            nameLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
            view.addSubview(nameLabel)
            
            emailLabel = UILabel()
            emailLabel.text = instructor.email
            emailLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
            view.addSubview(emailLabel)
            
            locationLabel = UILabel()
            locationLabel.text = instructor.location
            locationLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
            view.addSubview(locationLabel)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        courseNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(padding*3)
            make.trailing.equalToSuperview().offset(padding*(-3))
        }
        
        typeLabel1.snp.makeConstraints { make in
            make.top.equalTo(courseNameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(padding*3)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel1.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(padding*3)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(padding*3)
        }
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(padding*3)
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
