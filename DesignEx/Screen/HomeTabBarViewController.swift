//
//  HomeTabBarViewController.swift
//  DesignEx
//
//  Created by CONG PHAM on 10/30/20.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func configTabBar(){
        let homeVC = HomeViewController()
        let homeTab = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        homeVC.tabBarItem = homeTab
        let newfeedVC = NewFeedViewController()
        let newfeedTab = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        newfeedVC.tabBarItem = newfeedTab
        self.viewControllers = [homeVC,newfeedVC]
    }
    
    


}
