//
//  AuthorizationViewController.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let picture = UIImageView(image: UIImage(named: "ball.png"))
        picture.frame = CGRect(x: 0, y: 0, width: 256, height: 256)
        picture.center = CGPoint(x: view.center.x, y: view.center.y - 250)
        
        let signInButton = UIButton(type: .system)
        signInButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        signInButton.backgroundColor = .blue
        signInButton.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        signInButton.setTitle("Sign IN", for: .normal)
        signInButton.addTarget(self, action: #selector(signInFunc), for: .touchUpInside)
        
        let signUpButton = UIButton(type: .system)
        signUpButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        signUpButton.backgroundColor = .blue
        signUpButton.center = CGPoint(x: view.center.x, y: view.center.y - 40)
        signUpButton.setTitle("Sign UP", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpFunc), for: .touchUpInside)
        
        
        view.addSubview(picture)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc
    func signInFunc() {
        let signInVC = SignInViewController()
        signInVC.title = "Регистрация"
        navigationController?.pushViewController(signInVC, animated: true)
        
    }
    @objc
    func signUpFunc() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    

    

}
