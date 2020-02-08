//
//  TabBarViewControllerBuilder.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class TabBarControllerBuilder {
    
    public static func makeAuthorizationAndOpenApp() -> UITabBarController
    {
        let noteScreenVC = NotesViewController()
        let settingVC = SettingsViewController()
        let tasksVC = TasksViewController()
        let tabBar = UITabBarController()
        let navVCForNotes = UINavigationController()
        navVCForNotes.viewControllers = [noteScreenVC]
        
        tabBar.viewControllers = [tasksVC, navVCForNotes, settingVC]
        tabBar.modalPresentationStyle = .fullScreen
        return tabBar
    }
    
    public static func openAuthorizationWindow() -> UINavigationController
    {
        let regVC = LoginViewController()
        let navVCForReg = UINavigationController(rootViewController: regVC)
        navVCForReg.modalPresentationStyle = .fullScreen
        return navVCForReg
    }
    
    public static func isTokenValid() -> Bool {
        return UserDefaults.standard.string(forKey: "token") != "" && NSDate().timeIntervalSince1970 - UserDefaults.standard.double(forKey: "tokenDate") < 86400.0 - 10.0
    }
}
