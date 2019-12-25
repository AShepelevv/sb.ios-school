//
//  SecondViewController.swift
//  UIKitLesson
//
//  Created by Kaplan Deniz on 11/10/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Второй Controller"
		view.backgroundColor = .white
        
        let nextButton = UIButton(type: .system)
        nextButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        nextButton.center = view.center
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
	}
    
    @objc
    func nextButtonTapped() {
        let nextVC = ThirdViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}
}
