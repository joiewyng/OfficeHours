//
//  ViewController.swift
//  OH
//
//  Created by Joie Ng on 11/18/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    var loginButton: UIButton!
    var appNameLabel: UILabel!
    var emailTextField: UITextField!
    var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        
        loginButton = UIButton()
        loginButton.setTitle("Sign in", for: .normal)
        loginButton.setTitleColor(UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0), for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(loginButton)
        
        appNameLabel = UILabel()
        appNameLabel.text = "OH!"
        appNameLabel.textAlignment = .center
        appNameLabel.textColor = .white
        appNameLabel.font = appNameLabel.font.withSize(70)
        view.addSubview(appNameLabel)
        
        emailTextField = UITextField()
        emailTextField.placeholder = "xxx@cornell.edu"
        view.addSubview(emailTextField)
        
        pwTextField = UITextField()
        pwTextField.placeholder = "xxxxxxxx"
        view.addSubview(pwTextField)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        loginButton.snp.makeConstraints { make in
          
            make.height.equalTo(48)
            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-200)
            make.centerX.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints { make in
            
            make.height.equalTo(70)
//            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-600)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints{ make in
//            make.width
        }
    }

    @objc func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                      withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let loginStatus = true
            UserDefaults.standard.set(true, forKey: "loginStatus")
        } else {
//            print("\(error.localizedDescription)")
        }
    }
}

