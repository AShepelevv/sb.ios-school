//
//  ViewController.swift
//  Builder
//
//  Created by Максим Вильданов on 06/06/2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonPress = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        buttonPress.setTitle("press", for: .normal)
        buttonPress.addTarget(self, action: #selector(catalogButtonDidTapped), for: .touchUpInside)
        view.addSubview(buttonPress)
        buttonPress.translatesAutoresizingMaskIntoConstraints = false
        buttonPress.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonPress.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonPress.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonPress.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

    @objc func catalogButtonDidTapped() {
        
        let catalog = CatalogBuilder().setTitle("Catalog").build()
        self.present(catalog, animated: true, completion: nil)
    }
    
}

