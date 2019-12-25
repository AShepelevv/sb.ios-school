//
//  ViewController.swift
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Client.someClientCode(factory: ConcreteFactory1())
        Client.someClientCode(factory: ConcreteFactory2())

        
        
    }


}

