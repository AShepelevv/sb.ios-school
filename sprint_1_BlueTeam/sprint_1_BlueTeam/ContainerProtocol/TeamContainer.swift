//
//  TeamContainer.swift
//  sprint1
//
//  Created by Aleksey Shepelev on 25/10/2019.
//  Copyright © 2019 ashepelev. All rights reserved.
//

import Foundation

class TeamContainer<T>: ContainerProtocol {
 
    typealias Element = T
    var container : Array<T>
    
    var isEmpty: Bool {
        get {
            container.isEmpty
        }
    }
    
    var count: Int {
        get {
            container.count
        }
    }
    
    var capacity: Int {
        get {
            container.capacity
        }
    }
    
    init() {
        container = Array<T>()
    }
    
    func addNewElement(_ newElement: T) {
        container.append(newElement);
    }
    
    func getAnyElement() throws -> T {
        if count == 0 {
            let exception = NSException()
            exception.raise()
        }
        return container[0]
    }
}
