//
//  NoteScreenViewController.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class NoteScreenViewController: UIViewController {
    public static var countOfNotes = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads
            , tag: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let barItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(itemPressed))
        navigationItem.rightBarButtonItem = barItem
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        title = "У вас - \(NoteScreenViewController.countOfNotes) заметок"
    }
    


    
    @objc
    func itemPressed() {
        let noteEditVC = NoteEditViewController()
        navigationController?.pushViewController(noteEditVC, animated: true)
    }
   

}
