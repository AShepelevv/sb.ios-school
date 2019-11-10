//
//  TabBarViewControllerBuilder.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class TabBarViewControllerBuilder: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public static func makeAuthorizationAndOpenApp() -> UITabBarController
    {
        let noteScreenVC = NoteScreenViewController()
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
        let regVC = AuthorizationViewController()
        let navVCForReg = UINavigationController(rootViewController: regVC)
        navVCForReg.modalPresentationStyle = .fullScreen
        return navVCForReg
    }
    
    

}
