//
//  AddClassViewController.swift
//  OH
//
//  Created by Li Chai on 12/1/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit

protocol SelectDelegate {
    func selectCourse(selectedCourse: Course)
}

class AddClassModalViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    var searchController: UISearchController!
    var tableView: UITableView!
    let fullScreenSize = UIScreen.main.bounds.size
    var delegate: SelectDelegate!
    
    var nameLabel = UILabel()
    
    var searchResults: [Course]! = []
    var selectedCourse: Course = Course(titleLong: "", subject: "", catalogNbr: "", instructors: [Instructor(name: "John Doe", netid: "")])
    let padding: CGFloat = 8
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResults = []
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search e.g. 'CS 2110'"
        searchController.searchBar.sizeToFit()
        
        view.addSubview(searchController.searchBar)
        
        tableView = UITableView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height - 20),
                     style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = searchController.searchBar
        view.addSubview(tableView)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        var course = searchResults[indexPath.row]
        
        nameLabel.text = "\(course.subject) \(course.catalogNbr) \(course.titleLong)"
        nameLabel.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)  // dark grey
        cell.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(padding*2)
            make.trailing.equalToSuperview().offset(padding*(-2))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCourse = searchResults[indexPath.row]
        delegate.selectCourse(selectedCourse: selectedCourse)
        dismiss(animated: true)
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if (!searchText.isEmpty) && (searchText.contains(" ")){
                print(searchText)
                // For now only able to search courses of this semester
                NetworkManager.getCourseBasicInfo(searchText: searchText.uppercased()) { (courses) in
                    self.searchResults = courses
                    self.tableView.reloadData()
                }
            }
            else {
                self.searchResults = []
                self.tableView.reloadData()
            }
        }
    }
}
