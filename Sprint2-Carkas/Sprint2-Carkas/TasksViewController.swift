//
//  TasksViewController.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites
            , tag: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        infoLabel.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        infoLabel.text = "Здесь будут отображаться ваши задачи"
        infoLabel.numberOfLines = 5
        
        view.addSubview(infoLabel)
    }
    

    

}
