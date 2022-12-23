//
//  MainTabBarTableViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 22/12/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: SettingsViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "gear.circle")
        
        
        vc1.title = "Home"
        vc2.title = "Settings"
        
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2], animated: true)
        
    }
}
