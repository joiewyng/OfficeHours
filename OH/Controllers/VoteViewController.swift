//
//  VoteViewController.swift
//  OH
//
//  Created by Li Chai on 11/27/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {

    var segmentControl: UISegmentedControl!
    
    var titleLabel1: UILabel!
    var voteView: UICollectionView!
    
    var titleLabel: UILabel!
    var courseLabel: UILabel!
    var instructorLabel: UILabel!
    var timeLocationLabel: UILabel!
    var proofLabel: UILabel!
    var titleTextField: UITextField!
    var instructorTextField: UITextField!
    var timeLocationTextField: UITextField!
    var submitButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        segmentControl.selectedSegmentIndex = 0
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Vote/Request"
        
        segmentControl = UISegmentedControl(items: ["Vote", "Request"])
        segmentControl.tintColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        view.addSubview(segmentControl)
        
        // Vote View
        titleLabel1 = UILabel()
        titleLabel1.text = "Vote Office Hour"
        titleLabel1.font = UIFont.systemFont(ofSize: 30)
        titleLabel1.textColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        view.addSubview(titleLabel1)
        
        
        
        // Request View
        titleLabel = UILabel()
        titleLabel.text = "Request Office Hour"
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        view.addSubview(titleLabel)
        
        courseLabel = UILabel()
        courseLabel.text = "Course"
        courseLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(courseLabel)
        
        instructorLabel = UILabel()
        instructorLabel.text = "Intructor/TAs"
        instructorLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(instructorLabel)
        
        timeLocationLabel = UILabel()
        timeLocationLabel.text = "Time/Location"
        timeLocationLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(timeLocationLabel)
        
        proofLabel = UILabel()
        proofLabel.text = "Add Proof"
        proofLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(proofLabel)
        
        titleTextField = UITextField()
        titleTextField.bottomBorder()
        view.addSubview(titleTextField)
        
        instructorTextField = UITextField()
        instructorTextField.bottomBorder()
        view.addSubview(instructorTextField)
        
        timeLocationTextField = UITextField()
        timeLocationTextField.bottomBorder()
        view.addSubview(timeLocationTextField)
        
        submitButton = UIButton()
        submitButton.backgroundColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 10.0
        submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        submitButton.titleLabel?.textAlignment = .center
        submitButton.layer.masksToBounds = true
        
        view.addSubview(submitButton)
        
        titleLabel.isHidden = true
        courseLabel.isHidden = true
        instructorLabel.isHidden = true
        timeLocationLabel.isHidden = true
        proofLabel.isHidden = true
        titleTextField.isHidden = true
        instructorTextField.isHidden = true
        timeLocationTextField.isHidden = true
        submitButton.isHidden = true
        
        setupConstraints()
    }
    
    func setupConstraints() {
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(150)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
        }
        courseLabel.snp.makeConstraints{make in
            make.top.equalTo(self.view.snp.top).offset(190)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
        }
        instructorLabel.snp.makeConstraints{make in
            make.top.equalTo(courseLabel.snp_bottomMargin).offset(100)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
        }
        timeLocationLabel.snp.makeConstraints{make in
            make.top.equalTo(instructorLabel.snp_bottomMargin).offset(100)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
        }
        proofLabel.snp.makeConstraints{make in
            make.top.equalTo(timeLocationLabel.snp_bottomMargin).offset(100)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
        }
        titleTextField.snp.makeConstraints{make in
            make.top.equalTo(courseLabel.snp_bottomMargin).offset(30)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
            make.height.equalTo(25)
            make.width.equalTo(300)
        }
        instructorTextField.snp.makeConstraints{make in
            make.top.equalTo(instructorLabel.snp_bottomMargin).offset(30)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
            make.height.equalTo(25)
            make.width.equalTo(300)
        }
        timeLocationTextField.snp.makeConstraints{make in
            make.top.equalTo(timeLocationLabel.snp_bottomMargin).offset(30)
            make.leftMargin.equalTo(self.view.snp_leftMargin).offset(40)
            make.height.equalTo(25)
            make.width.equalTo(300)
        }
        submitButton.snp.makeConstraints{make in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
    }
    

    @objc func switchView() {
        switch segmentControl.selectedSegmentIndex {
        case 0:  // vote view
            titleLabel.isHidden = true
            courseLabel.isHidden = true
            instructorLabel.isHidden = true
            timeLocationLabel.isHidden = true
            proofLabel.isHidden = true
            titleTextField.isHidden = true
            instructorTextField.isHidden = true
            timeLocationTextField.isHidden = true
            submitButton.isHidden = true
        case 1: // request view
            titleLabel.isHidden = false
            courseLabel.isHidden = false
            instructorLabel.isHidden = false
            timeLocationLabel.isHidden = false
            proofLabel.isHidden = false
            titleTextField.isHidden = false
            instructorTextField.isHidden = false
            timeLocationTextField.isHidden = false
            submitButton.isHidden = false
        default:
            break;
        }
    }
}

extension UITextField{
    func bottomBorder(){
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
