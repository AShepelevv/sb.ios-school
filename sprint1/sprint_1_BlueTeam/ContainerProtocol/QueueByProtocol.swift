//
//  QueueByProtocol.swift
//  sprint_1_BlueTeam
//
//  Created by Aleksey Shepelev on 26/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

class Queue<T> : ListByProtocol<T> {
    func pop() -> T? {
        if let fisrt = begin.next {
            if let second = fisrt.next {
                second.previous = begin
                begin.next = second
                count -= 1
                return fisrt.value
            }
        }
        return nil;
    }
}
