//
//  CourseTableCell.swift
//  OH
//
//  Created by Joie Ng on 11/27/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

protocol DetailPressedDelegate {
    func buttonPressed(index: Int)
}

class CourseTableCell: UITableViewCell {
    
    var nameButton: UIButton!
    var detailButton: UIButton!
    
    var index = 0 // index of the cell that has selected button
    let padding: CGFloat = 8
    
    var delegate: DetailPressedDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        nameButton = UIButton()
        nameButton.setTitleColor(UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0), for: .normal)  // hot pink
        nameButton.setTitleColor(.white, for: .selected)
        nameButton.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)  // light grey
        nameButton.layer.cornerRadius = 8.0
        nameButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        nameButton.contentEdgeInsets = UIEdgeInsets(top: padding*2, left: padding*4, bottom: padding*2, right: padding*4)

//        nameButton.tintColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        
        detailButton = UIButton()
        detailButton.setTitle("View detail > ", for: .normal)
        detailButton.setTitleColor(.black, for: .normal)
        detailButton.addTarget(self, action: #selector(viewDetail), for: .touchUpInside)
        
        contentView.addSubview(nameButton)
        contentView.addSubview(detailButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        nameButton.snp.makeConstraints{ make in
//            make.top.equalTo(contentView.snp.top).offset(padding)
            make.leading.equalTo(contentView.snp.leading).offset(padding * 2)
            make.centerY.equalToSuperview()
        }
        detailButton.snp.makeConstraints{make in
//            make.top.equalTo(contentView.snp.top).offset(padding * 2)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.snp.trailing).offset(padding * (-2))
        }
    }
//    override func updateConstraints() {
//        nameButton.snp.makeConstraints{ make in
//            make.top.equalTo(contentView.snp.top).offset(padding)
//            make.leading.equalTo(contentView.snp.leading).offset(padding)
//        }
//        detailButton.snp.makeConstraints{make in
//            make.trailing.equalTo(contentView.snp.trailing).offset(padding * (-1))
//        }
//        someLabel.snp.makeConstraints{ make in
//            make.top.equalTo(nameButton.snp.bottom).offset(padding)
//            make.leading.equalTo(contentView.snp.leading).offset(padding)
//        }
//    }
    
    func configure(for course: Course) {
        nameButton.setTitle(course.abbrv, for: .normal)
    }
    
    @objc func pressed() {
        if (nameButton.isSelected) {
            nameButton.backgroundColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        } else {
            nameButton.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        }
    }
    
    @objc func viewDetail() {
        delegate?.buttonPressed(index: index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
