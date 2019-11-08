//
//  SignInViewController.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let openApp = UIButton(type: .roundedRect)
        openApp.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        openApp.backgroundColor = .blue
        openApp.center = view.center
        openApp.setTitle("Нажмите на кнопку", for: .normal)
        openApp.addTarget(self, action: #selector(openAppFunc), for: .touchUpInside)
        openApp.tintColor = .white
        
        
        view.addSubview(openApp)
    }
    
    @objc
    func openAppFunc() {
        UserDefaults.standard.set(true, forKey: "isAthorized")
        present(TabBarViewControllerBuilder.makeAuthorizationAndOpenApp(), animated: true, completion: nil)
        
    }

    

}
