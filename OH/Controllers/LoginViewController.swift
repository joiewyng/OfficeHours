//
//  ViewController.swift
//  OH
//
//  Created by Joie Ng on 11/18/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var loginButton: UIButton!
    var appNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0), for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(loginButton)
        
        appNameLabel = UILabel()
        appNameLabel.text = "OH!"
        appNameLabel.textAlignment = .center
        appNameLabel.textColor = .white
        appNameLabel.font = appNameLabel.font.withSize(70)
        view.addSubview(appNameLabel)
        
        
        setupConstraints()
    }
    
    func setupConstraints(){
        loginButton.snp.makeConstraints { make in
          
            make.height.equalTo(48)
            make.width.equalTo(200)
            make.bottom.equalTo(self.view.snp.bottom).offset(-200)
            make.centerX.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints { make in
            
            make.height.equalTo(70)
            make.width.equalTo(200)
            make.bottom.equalTo(self.view.snp.bottom).offset(-600)
            make.centerX.equalToSuperview()
        }
    }


}

