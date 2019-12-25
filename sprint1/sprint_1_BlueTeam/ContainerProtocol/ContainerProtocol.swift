//
//  ContainerProtocol.swift
//  sprint1
//
//  Created by Aleksey Shepelev on 25/10/2019.
//  Copyright © 2019 ashepelev. All rights reserved.
//

protocol ContainerProtocol {
    associatedtype Element
    
    var count : Int { get }
    
    func push(newElement : Element)
    func getBy(index: Int) -> Element?
}
