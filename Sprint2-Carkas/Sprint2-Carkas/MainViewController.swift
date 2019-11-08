//
//  ViewController.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let startButton = UIButton(type: .roundedRect)
        startButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        startButton.backgroundColor = .blue
        startButton.center = view.center
        startButton.setTitle("Начать!", for: .normal)
        startButton.addTarget(self, action: #selector(startFunc), for: .touchUpInside)
        
        let helloLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        helloLabel.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        helloLabel.text = "Добро пожаловать!"
        
        view.addSubview(startButton)
        view.addSubview(helloLabel)


    }
    
    @objc
    func startFunc() {
        let isAthorized = UserDefaults.standard.bool(forKey: "isAthorized") 
        if (!isAthorized)
        {
            let regVC = AuthorizationViewController()
            let navVCForReg = UINavigationController()
            navVCForReg.viewControllers = [regVC]
            present(navVCForReg, animated: true, completion: nil)
        } else {
            let noteScreenVC = NoteScreenViewController()
            let settingVC = SettingsViewController()
            let tasksVC = TasksViewController()
            let tabBar = UITabBarController()
            let navVCForNotes = UINavigationController()
            navVCForNotes.viewControllers = [noteScreenVC]
            
            
            tabBar.viewControllers = [tasksVC, navVCForNotes, settingVC]
            present(tabBar, animated: true, completion: nil)
        }
        
    }
    

    
    


}

