//
//  VoteCollectionViewCell.swift
//  OH
//
//  Created by Joie Ng on 12/2/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import Snapkit

class VoteCollectionViewCell: UICollectionViewCell{
    var courseAbbrvLabel: UILabel!
    var courseNameLabel: UILabel!
    var instructor: UILabel!
    var courseNameLabel: UILabel!
    var courseAbbrvLabel: UILabel!
    var courseNameLabel: UILabel!
    var dayTimeLabelLabel: UILabel!
    var dayTimeLabel2: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let voteEntry1 = ProfOH(instructor: "Francois Guimbretiere", day: "Monday", startTime: "15:00", endTime: "18:00", location: "Gates 201")
        let voteEntry2 = ProfOH(instructor: "Francois Guimbretiere", day: "Thursday", startTime: "13:00", endTime: "14:00", location: "Gates 201")
        
        
        courseAbbrvLabel = UILabel()
        courseAbbrvLabel.text = "something"
        courseAbbrvLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseAbbrvLabel)
        
        courseNameLabel = UILabel()
        courseNameLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseNameLabel)
        
        instructor = UILabel()
        instructor.adjustsFontSizeToFitWidth = true
        contentView.addSubview(instructor)
        
        courseNameLabel = UILabel()
        courseNameLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseNameLabel)
        
        courseAbbrvLabel = UILabel()
        courseAbbrvLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseAbbrvLabel)
        
        courseNameLabel = UILabel()
        courseNameLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseNameLabel)
        
        dayTimeLabel = UILabel()
        dayTimeLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(dayTimeLabel)
        
        dayTimeLabel2 = UILabel()
        dayTimeLabel2.adjustsFontSizeToFitWidth = true
        contentView.addSubview(dayTimeLabel2)
    }
    
    
    override func updateConstraints() {
        courseAbbrvLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        courseNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(courseNameLabel.snp.bottom).offset(5)
        }
        instructor.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp_leftMargin).offset(20)
            make.top.equalTo(courseAbbrvLabel.snp.bottom).offset(10)
        }
        dayTimeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp_leftMargin).offset(20)
            make.top.equalTo(instructor.snp.bottom).offset(10)
        }
        dayTimeLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp_leftMargin).offset(20)
            make.top.equalTo(dayTimeLabel.snp.bottom).offset(10)
        }
        
        super.updateConstraints()
    }
}
