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
    
    let padding: CGFloat = 8
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        nameButton = UIButton()
        nameButton.setTitleColor(.gray, for: .normal)
        nameButton.backgroundColor = .white
        nameButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
//        nameButton.tintColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        
        detailButton = UIButton()
        detailButton.setTitle("View detail", for: .normal)
        detailButton.setTitleColor(.black, for: .normal)
        detailButton.addTarget(self, action: #selector(viewDetail), for: .touchUpInside)
        
        contentView.addSubview(nameButton)
        contentView.addSubview(detailButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        nameButton.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(padding)
            make.leading.equalTo(contentView.snp.leading).offset(padding)
        }
        detailButton.snp.makeConstraints{make in
            make.trailing.equalTo(contentView.snp.trailing).offset(padding * (-1))
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
            nameButton.setTitleColor(.white, for: .selected)
        } else {
            nameButton.backgroundColor = .white
            nameButton.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func viewDetail() {
        let detailVC = DetailsViewController()
//        detailVC.delegate = self
        present(detailVC, animated: true, completion: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
