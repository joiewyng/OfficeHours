//
//  VoteCollectionViewCell.swift
//  OH
//
//  Created by Joie Ng on 12/2/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

class VoteCollectionViewCell: UICollectionViewCell{
    var courseAbbrvLabel: UILabel!
    var courseNameLabel: UILabel!
    var instructor: UILabel!
    var dayTimeLabel: UILabel!
    var dayTimeLabel2: UILabel!
    var upvoteButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
        
        courseAbbrvLabel = UILabel()
        courseAbbrvLabel.text = "INFO 4320"
        courseAbbrvLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseAbbrvLabel)
        
        courseNameLabel = UILabel()
        courseNameLabel.text = "Rapid Prototyping and Physical Computing"
        courseNameLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(courseNameLabel)
        
        instructor = UILabel()
        instructor.adjustsFontSizeToFitWidth = true
        contentView.addSubview(instructor)
        
        dayTimeLabel = UILabel()
        dayTimeLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(dayTimeLabel)
        
        dayTimeLabel2 = UILabel()
        dayTimeLabel2.text = "Fri 13:30 - 14:00"
        dayTimeLabel2.adjustsFontSizeToFitWidth = true
        contentView.addSubview(dayTimeLabel2)
        
        upvoteButton = UIButton()
        upvoteButton.setImage(UIImage.init(named: "greyarrow"), for: .normal)
        upvoteButton.addTarget(self, action:#selector(addVote), for:.touchUpInside)
        contentView.addSubview(upvoteButton)
        
//        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func updateConstraints() {
        courseAbbrvLabel.snp.makeConstraints { make in
//            make.leading.equalTo(contentView).offset(20)
//            make.trailing.equalTo(contentView).offset(-20)
            make.centerX.equalTo(contentView.snp_centerXWithinMargins)
            make.top.equalTo(contentView).offset(10)
        }
        courseNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalTo(courseAbbrvLabel.snp.bottom).offset(5)
        }
        instructor.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalTo(courseNameLabel.snp.bottom).offset(20)
        }
        dayTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalTo(instructor.snp.bottom).offset(20)
        }
        dayTimeLabel2.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalTo(dayTimeLabel.snp.bottom).offset(20)
        }
        
        upvoteButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-20)
        }
        

        super.updateConstraints()
    }
//
    func configure(for voteEntry: ProfOH ){
        instructor.text = voteEntry.instructor.firstName + " " + voteEntry.instructor.lastName
        dayTimeLabel.text = voteEntry.day + " " + voteEntry.startTime + "-" + voteEntry.endTime
        
    }
    
    @objc func addVote(){
        let greyArrow = UIImage.init(named: "greyarrow")
        let pinkArrow = UIImage.init(named: "pinkarrow")

        if (upvoteButton.image(for: .normal) == greyArrow){
            upvoteButton.setImage(pinkArrow, for: .normal)
        } else{//if upvoteButton = pinkarrow
            upvoteButton.setImage(greyArrow, for: .normal)
        }
        print("button tapped")
        
    }
}
