//
//  Products.swift
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation

// MARK: -  A Products

protocol AbstractProductA {
    func usefulFunctionA() -> String
}


class ConcreteProductA1: AbstractProductA {
    func usefulFunctionA() -> String {
        return "A1"
    }
}

class ConcreteProductA2: AbstractProductA {
    func usefulFunctionA() -> String {
        return "A2"
    }
}

// MARK: -  B Products

protocol AbstractProductB {
    func usefulFunctionB() -> String
}

class ConcreteProductB1: AbstractProductB {
    func usefulFunctionB() -> String {
        return "B1"
    }
}

class ConcreteProductB2: AbstractProductB {
    func usefulFunctionB() -> String {
        return "B2"
    }
}




