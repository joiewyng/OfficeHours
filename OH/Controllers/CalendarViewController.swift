//
//  CalendarViewController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit
import JTAppleCalendar

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var calendarView: JTAppleCalendarView!
    let formatter = DateFormatter()
    
    var titleLabel: UILabel!
    var tableView: UITableView!
    
    var courseList: [Course]!
    let reuseIdentifier = "courseCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Office Hour"
        
        calendarView = JTAppleCalendarView(frame: .zero)
        calendarView.scrollDirection = .horizontal
        calendarView.showsVerticalScrollIndicator = false
        calendarView.showsHorizontalScrollIndicator = false
        calendarView.isPagingEnabled = true
        
        view.addSubview(calendarView)
        
        titleLabel = UILabel()
        titleLabel.text = "please show up"
        view.addSubview(titleLabel)
        
        getCourses()
        
        tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseTableCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
    }
    
    // get courses from supposably JSON, now hard-coded
    func getCourses() {
        let teacher1 = Teacher(type: .instructor, name: "François Guimbretière", email: "francois@cornell.edu", location: "241 Gates Hall")
        let teacher2 = Teacher(type: .instructor, name: "D. Gries", email: "dgries@cornell.edu", location: "185-Aud Statler Hall")
        let course1 = Course(name: "Rapid Prototyping and Physical Computing", abbrv: "INFO4320", instructors:[teacher1])
        let course2 = Course(name: "Object-Oriented Programming and Data Structures", abbrv: "CS2110", instructors: [teacher2])
        courseList = [course1, course2]
    }
    
    func setupConstraints(){
        calendarView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(380)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.leading.trailing.bottom.equalToSuperview()
//            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        titleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(200)
        }
    }
    
    // list of courses tableView configurations
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CourseTableCell
        let course = courseList[indexPath.row]
        cell.configure(for: course)
        cell.index = indexPath.row
        cell.selectionStyle = .none
        cell.delegate = self
//        cell.needsUpdateConstraints()
        return cell
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CalendarViewController: DetailPressedDelegate {
    func buttonPressed(index: Int) {
        let detailVC = DetailsViewController()
        detailVC.course = courseList[index]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let calendarCell = cell as! CalendarCell
    }
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 08 01")!
        let endDate = formatter.date(from: formatter.string(from: Date()))!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        return cell
    }
}
