//
//  DashboardTabBarController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
        }


    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }

    func setupVCs() {
        let viewModel1 = EventListViewModel()
        let viewModel2 = ScheduleListViewModel()
          viewControllers = [
            createNavController(for: EventsViewController(viewModel: viewModel1), title: NSLocalizedString("Events", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: ScheduleViewController(viewModel: viewModel2), title: NSLocalizedString("Schedule", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
              
          ]
      }
}

