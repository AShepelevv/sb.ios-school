//
//  NoteEditViewController.swift
//  Sprint2-Carkas
//
//  Created by Дмитрий Гришин on 08/11/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import UIKit

class NoteEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let textView = UITextView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height))
        view.addSubview(textView)
        
        let barItemSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(itemPressedSave))
        navigationItem.rightBarButtonItem = barItemSave
        
        
    }
    
    @objc
    func itemPressedSave() {
        NoteScreenViewController.countOfNotes = NoteScreenViewController.countOfNotes + 1
        navigationController?.popViewController(animated: true)
    }
    

   
}
