//
//  TabBarController.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 13/08/2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let item1 = UINavigationController(rootViewController: TradeViewController())
        let item2 = UINavigationController(rootViewController: ActivityViewController())
        let icon1 = UITabBarItem(title: "Trade", image: UIImage(named: "activity"), selectedImage:UIImage(named: "activity1"))
        let icon2 =  UITabBarItem(title: "Top", image: UIImage(named: "people"), selectedImage:UIImage(named: "people1"))
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item2.title = "Top"
        
        let controllers = [item1, item2]
        selectedIndex = 0
        self.viewControllers = controllers
        self.tabBar.backgroundColor = .tabBarColor
        self.tabBar.unselectedItemTintColor = .lightGray2
        self.tabBar.tintColor = .lightGreen
        
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }

}
