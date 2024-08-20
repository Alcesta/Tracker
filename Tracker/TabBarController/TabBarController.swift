//
//  TabBarController.swift
//  Tracker
//
//  Created by Olga Ilyushina on 15.08.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = UIColor.gray.cgColor
        let normalColor = UIColor.Gray
        let selectedColor = UIColor.blue
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: normalColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        
        self.viewControllers = [setTrackersViewController(), setStatisticsViewController()]
    }

    func setTrackersViewController() -> UINavigationController {
        let trackersViewController = TrackersViewController()
        trackersViewController.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: UIImage(named: "tab_trackers"),
            selectedImage: nil)
        return UINavigationController(rootViewController: trackersViewController)
    }

    func setStatisticsViewController() -> UINavigationController {
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.tabBarItem = UITabBarItem(
            title: "Статистика",
            image:  UIImage(named: "tab_statistics"),
            selectedImage: nil)
       
        return UINavigationController(rootViewController: statisticsViewController)
    }
}
