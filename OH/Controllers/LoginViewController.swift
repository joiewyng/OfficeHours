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
        emailTextField.textColor = .white
        emailTextField.tintColor = .white
        emailTextField.textAlignment = .center
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.addSubview(emailTextField)
        
        pwTextField = UITextField()
        pwTextField.textAlignment = .center
        pwTextField.textColor = .white
        pwTextField.tintColor = .white
        pwTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.addSubview(pwTextField)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(300)
            make.centerX.equalToSuperview().offset(-40)
        }
        pwTextField.snp.makeConstraints{ make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(200)
            make.top.equalTo(pwTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        appNameLabel.snp.makeConstraints { make in
            
            make.height.equalTo(70)
//            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-600)
            make.centerX.equalToSuperview()
        }
        
    }

    @objc func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                      withError error: NSError!) {
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            let loginStatus = true
//            UserDefaults.standard.set(true, forKey: "loginStatus")
//        } else {
////            print("\(error.localizedDescription)")
//        }
//
        // make post request to db
        self.present(OHTabBarController(), animated: true, completion: nil)
//        let appdelegate = AppDelegate()
//        appdelegate.window?.rootViewController = OHTabBarController()
    }
}

