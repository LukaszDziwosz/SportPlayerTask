//
//  DashboardTabBarController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit

class DashboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.tabBar.barTintColor = .systemGray
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .systemGray
        self.tabBar.unselectedItemTintColor = .systemGray
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           let item1 = EventsViewController()
           let item2 = ScheduleViewController()
           let icon1 = UITabBarItem(title: "Events", image: UIImage(systemName: "square"), selectedImage: UIImage(systemName: "square.fill"))
           let icon2 = UITabBarItem(title: "Schedule", image: UIImage(systemName: "square"), selectedImage: UIImage(systemName: "square.fill"))
           item1.tabBarItem = icon1
           item2.tabBarItem = icon2
           let controllers = [item1, item2]
           self.viewControllers = controllers
          // self.selectedIndex = 0
       }

    

}
extension DashboardTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            print("Should select viewController: \(viewController.title ?? "") ?")
            return true;
        }
    
}
