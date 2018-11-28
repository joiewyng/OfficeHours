//
//  DetailsViewController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {

    var courseAbbrvLabel: UILabel!
    var course: Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        courseAbbrvLabel = UILabel()
        courseAbbrvLabel.text = course.abbrv
        courseAbbrvLabel.textColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
        view.addSubview(courseAbbrvLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        courseAbbrvLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.top.equalTo(self.view.snp.top).offset(70)
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
