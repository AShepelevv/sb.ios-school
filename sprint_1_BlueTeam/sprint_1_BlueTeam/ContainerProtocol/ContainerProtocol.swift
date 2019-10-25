//
//  ContainerProtocol.swift
//  sprint1
//
//  Created by Aleksey Shepelev on 25/10/2019.
//  Copyright © 2019 ashepelev. All rights reserved.
//

protocol ContainerProtocol {
    associatedtype Element
    
    var isEmpty : Bool { get }
    var count : Int { get }
    var capacity : Int { get }
    
    func addNewElement(_ : Element)
    func getAnyElement() throws -> Element
    func removeAllElements(keepCapacity: Bool)
}

//  В статье на medium.com написано, что так можно
//  параметры по умолчанию передавать
extension ContainerProtocol {
    func removeAllElements(keepCapacity: Bool = false) {
        removeAllElements(keepCapacity: keepCapacity)
    }
}
