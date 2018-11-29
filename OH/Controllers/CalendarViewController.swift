//
//  CalendarViewController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit
import SnapKit
import CalendarKit
//import JTAppleCalendar
//import JZCalendarWeekView

//class CalendarViewController: DayViewController, UITableViewDataSource, UITableViewDelegate, FSCalendarDelegate, FSCalendarDataSource {
class CalendarViewController: DayViewController, UITableViewDataSource, UITableViewDelegate {
    
    let formatter = DateFormatter()
    private weak var calendar: FSCalendar!
    
    var calendarData: [[String]]?
    var tableView: UITableView!
    
    var courseList: [Course]!
    let reuseIdentifier = "courseCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Office Hour"
        
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.size.height + 40, width: UIScreen.main.bounds.width, height: 300))
//        calendar.appearance.selectionColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
//        calendar.appearance.todayColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
//        calendar.appearance.titleTodayColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
//        calendar.appearance.headerTitleColor = .black
//        calendar.appearance.weekdayTextColor = UIColor(red:0.89, green:0.24, blue:0.34, alpha:1.0)
//        calendar.dataSource = self as? FSCalendarDataSource
//        calendar.delegate = self as! FSCalendarDelegate
//        view.addSubview(calendar)
//        self.calendar = calendar

        getEvents()
        getCourses()
        reloadData()
        
        tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseTableCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        JZWeekViewHelper.viewTransitionHandler(to: size, weekView: calendarWeekView)
////    }
//    func getEvents() {
//        var event1 = "INFO 4320"
//        calendarData = "INFO 4320",
//        calendarData = [["Breakfast at Tiffany's",
//                         "New York, 5th avenue"],
//                        
//                        ["Workout",
//                         "Tufteparken"],
//                        
//                        ["Meeting with Alex",
//                         "Home",
//                         "Oslo, Tjuvholmen"],
//                        
//                        ["Beach Volleyball",
//                         "Ipanema Beach",
//                         "Rio De Janeiro"],
//                        
//                        ["WWDC",
//                         "Moscone West Convention Center",
//                         "747 Howard St"],
//                        
//                        ["Google I/O",
//                         "Shoreline Amphitheatre",
//                         "One Amphitheatre Parkway"],
//                        
//                        ["flight to Svalbard",
//                         "Oslo Gardermoen"],
//                        
//                        ["Developing CalendarKit",
//                         "Worldwide"],
//                        
//                        ["Software Development Lecture",
//                         "Mikpoli MB310",
//                         "Craig Federighi"],
//                        ]
//    }
    
    // get courses from supposably JSON, now hard-coded
    func getCourses() {
        let teacher1 = Teacher(type: .instructor, name: "François Guimbretière", email: "francois@cornell.edu", location: "241 Gates Hall")
        let teacher2 = Teacher(type: .instructor, name: "D. Gries", email: "dgries@cornell.edu", location: "185-Aud Statler Hall")
        let course1 = Course(name: "Rapid Prototyping and Physical Computing", abbrv: "INFO4320", instructors:[teacher1])
        let course2 = Course(name: "Object-Oriented Programming and Data Structures", abbrv: "CS2110", instructors: [teacher2])
        courseList = [course1, course2]
    }
    
//    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
//        calendar.snp.updateConstraints { (make) in
//            make.height.equalTo(bounds.height)
//            // Do other updates
//        }
//        self.view.layoutIfNeeded()
//    }
    
    func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.leading.trailing.bottom.equalToSuperview()
//            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    // list of courses tableView configurations
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CourseTableCell
        let course = courseList[indexPath.row]
        cell.configure(for: course)
        cell.index = indexPath.row
        cell.selectionStyle = .none
        cell.delegate = self as? DetailPressedDelegate
//        cell.needsUpdateConstraints()
        return cell
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Return an array of EventDescriptors for particular date
//    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
//        var models = EventDescriptor(date)// Get events (models) from the storage / API
//
//        var events = [Event]()
//
//        for model in models {
//            // Create new EventView
//            let event = Event()
//            // Specify StartDate and EndDate
//            event.startDate = model.startDate
//            event.endDate = model.endDate
//            // Add info: event title, subtitle, location to the array of Strings
//            var info = [model.title, model.location]
//            info.append("\(datePeriod.beginning!.format(with: "HH:mm")) - \(datePeriod.end!.format(with: "HH:mm"))")
//            // Set "text" value of event by formatting all the information needed for display
//            event.text = info.reduce("", {$0 + $1 + "\n"})
//            events.append(event)
//        }
//        return events
//    }
    
}

