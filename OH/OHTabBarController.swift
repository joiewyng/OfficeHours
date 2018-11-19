//
//  OHTabBarController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit

class OHTabBarController: UITabBarController {

    let detailsViewController = DetailsViewController()
    let calendarViewController = CalendarViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        delegate = self as! UITabBarControllerDelegate?
        let calendarNavigationController = UINavigationController(rootViewController: self.calendarViewController)
        calendarNavigationController.navigationBar.barStyle = .black
        calendarNavigationController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "unselectedcalendarbaricon"), tag: 0)
        
        let detailNavigationController = UINavigationController(rootViewController: detailsViewController)
        detailNavigationController.navigationBar.barStyle = .black
        detailNavigationController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "unselectedinfoicon"), tag: 1)

        let navigationControllers = [calendarNavigationController, detailNavigationController]
        navigationControllers.forEach { $0.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0) }
        setViewControllers(navigationControllers, animated: false)
        
        // Do any additional setup after loading the view.
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

//extension OHTabBarController: UITabBarControllerDelegate {
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if let navVC = viewController as? UINavigationController, let detailsVC = navVC.viewControllers.first as? DetailsViewController {
//            detailsVC.scrollToTop()
//        } else if let navVC = viewController as? UINavigationController, let lookAheadVC = navVC.viewControllers.first as? LookAheadViewController {
//            lookAheadVC.scrollToTop()
//        }
//    }
//
//}
