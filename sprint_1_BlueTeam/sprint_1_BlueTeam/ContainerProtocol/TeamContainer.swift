//
//  TeamContainer.swift
//  sprint1
//
//  Created by Aleksey Shepelev on 25/10/2019.
//  Copyright © 2019 ashepelev. All rights reserved.
//

class TeamContainer<T>: ContainerProtocol {
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
    
    func append(_ newElement: T) {
        container.append(newElement)
    }
    
    func remove(at: Int) -> T {
        return container.remove(at: at)
    }
    
    func sort(by: (T, T) -> Bool) {
        container.sort(by: by)
    }
    
    func sorted(by: (T, T) -> Bool) -> [T] {
        return container.sorted(by: by)
    }
    
    typealias Element = T
    var container : Array<T>
    
    init() {
        container = Array<T>()
    }
}
