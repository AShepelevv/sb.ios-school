//
//  CatalogViewController.swift
//  Builder
//
//  Created by Максим Вильданов on 06/06/2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    
    var interactor: Interactor!
    
    init(title: String, interactor: Interactor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue

        // Do any additional setup after loading the view.
    }
    

}
