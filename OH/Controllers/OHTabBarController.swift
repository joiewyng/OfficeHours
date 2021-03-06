//
//  OHTabBarController.swift
//  OH
//
//  Created by Joie Ng on 11/19/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//

import UIKit

class OHTabBarController: UITabBarController {

    let calendarViewController = CalendarViewController()
    let voteViewController = VoteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        delegate = self
        
        let calendarNavigationController = UINavigationController(rootViewController: calendarViewController)
        calendarNavigationController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "unselectedcalendarbaricon"), tag: 0)
        
        let voteNavigationController = UINavigationController(rootViewController: voteViewController)
        voteNavigationController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "unselectedinfoicon"), tag: 1)

        let navigationControllers = [calendarNavigationController, voteNavigationController]
        navigationControllers.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            $0.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)

        }

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
