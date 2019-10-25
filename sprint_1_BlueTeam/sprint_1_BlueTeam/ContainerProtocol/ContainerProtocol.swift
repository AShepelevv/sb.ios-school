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
    
    func append(_ newElement: Element)
    
    func remove(at: Int) -> Element
    
    func sort(by: (Element, Element) -> Bool)
    
    func sorted(by: (Element, Element) -> Bool) -> [Element]
}
