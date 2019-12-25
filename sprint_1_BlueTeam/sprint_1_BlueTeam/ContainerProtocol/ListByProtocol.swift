//
//  TeamContainer.swift
//  sprint1
//
//  Created by Aleksey Shepelev on 25/10/2019.
//  Copyright © 2019 ashepelev. All rights reserved.
//

import Foundation

class ListByProtocol<T>: ContainerProtocol {
    
    typealias Element = T
    
    class ListNode {
        var next: ListNode?
        weak var previous : ListNode?
        var value : T?
        
        init() {
            value = nil
        }
        
        init(value: T) {
            // Нужно ли здесь класть копию или можно оставить так?
            self.value = value
        }
        
        init(value: T, previous: ListNode?, next: ListNode?) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }
    
    public var count: Int = 0
    var begin: ListNode = ListNode()
    var end: ListNode = ListNode()
    
    init() {
        begin.next = end
        end.previous = begin
        count = 0
    }
    
    func push(newElement: T) {
        let newNode = ListNode(value: newElement, previous: end.previous, next: end)
        if let preLast = end.previous {
            preLast.next = newNode
        }
        end.previous = newNode
        count += 1
    }
    
    func getBy(index: Int) -> T? {
        if (index > count) {
            return nil
        }
        var curNode : ListNode = begin
        for _ in 0...index {
            if let curNodeUnwrapped = curNode.next {
                curNode = curNodeUnwrapped
            } else {
                return nil
            }
        }
        return curNode.value
    }

}
