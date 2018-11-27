//
//  CourseTableCell.swift
//  OH
//
//  Created by Joie Ng on 11/27/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

class CourseTableCell: UITableViewCell {
    
    var nameButton: UIButton!
    var detailButton: UIButton!
    
    var someLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .blue
        
        nameButton = UIButton()
        nameButton.setTitleColor(.gray, for: .normal)
        nameButton.backgroundColor = .white
        nameButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
//        nameButton.tintColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        
        detailButton = UIButton()
        detailButton.setTitle("View detail", for: .normal)
//        detailButton.titleLabel?.text = "View Detail"
        
        someLabel = UILabel()
        someLabel.text = "yeahhhhh"
        contentView.addSubview(someLabel)
        
        contentView.addSubview(nameButton)
        contentView.addSubview(detailButton)
        
    }
    override func updateConstraints() {
        
        detailButton.snp.makeConstraints{make in
            make.top.equalTo(contentView.snp.top).offset(50)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    func configure(course: Course) {
        nameButton.setTitle(course.name, for: .normal)
//        nameButton.titleLabel?.text = course.name
    }
    @objc func pressed() {
        if (nameButton.isSelected) {
            nameButton.backgroundColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
            nameButton.setTitleColor(.white, for: .selected)
        } else {
            nameButton.backgroundColor = .white
            nameButton.setTitleColor(.gray, for: .normal)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
