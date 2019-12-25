//
//  EnumBasedDoubleList.swift
//  sprint_1_BlueTeam
//
//  Created by Oleg Azhel on 28/10/2019.
//  Copyright © 2019 BlueTeam. All rights reserved.
//

// MARK: - Enum
public indirect enum DoubleLinkedList<T> {
	case Nil
	case Node(ListNode)
}

// MARK: - ListNode
extension DoubleLinkedList {
	public final class ListNode {
		var next:DoubleLinkedList<T>
		var prev:DoubleLinkedList<T>
		let value: T

		init(value: T, next: DoubleLinkedList<T>, prev: DoubleLinkedList<T>) {
			self.value = value
			self.next = next
			self.prev = prev
		}
	}
}

// MARK: - Extract node
extension DoubleLinkedList {
	private func extractNode(_ node:DoubleLinkedList<T>) -> ListNode? {
		if case .Node(let node) = node {
			return node
		}
		return nil
	}
}

// MARK: - Init
extension DoubleLinkedList {
	public init() {
		self = .Nil
	}
}

// MARK: - Empty
extension DoubleLinkedList {
	public var isEmpty:Bool {
		if let _ = extractNode(self) {
			return false
		}
		return true
	}
}

// MARK: - Push
extension DoubleLinkedList {
	public mutating func push(_ value:T) {
		self = .Node(ListNode(value: value,
							  next: self,
							  prev: .Nil))
		if let node = extractNode(self) {
			if let next = extractNode(node.next) {
				next.prev = self
			}
		}
	}
}

// MARK: - Append
extension DoubleLinkedList {
	public mutating func append(_ value: T) {
		if var node = extractNode(self) {
			while let next = extractNode(node.next) {
				node = next
			}
			node.next = .Node(ListNode(value: value,
									   next: .Nil,
									   prev: .Node(node)))
		} else {
			push(value)
		}
	}
}

// MARK: - Length
extension DoubleLinkedList {
	public func listLength() -> UInt {
		var result:UInt = 0
		var ptr = self
		while let node = extractNode(ptr) {
			result += 1
			ptr = node.next
		}
		return result
	}
}

// MARK: - Node at
extension DoubleLinkedList {
	public func node(at index: UInt) -> ListNode? {
		var node = extractNode(self)
		for _ in 0..<index {
			if let tmp = node {
				node = extractNode(tmp.next)
			} else {
				break
			}
		}
		return node
	}
}

// MARK: - Insert at
extension DoubleLinkedList {
	public mutating func insert(value: T, at index: UInt) {
		if let node = node(at: index) {
			if let prev = extractNode(node.prev) {
				let newNode:DoubleLinkedList<T>
				newNode = .Node(ListNode(value: value,
										 next: .Nil,
										 prev: node.prev))
				prev.next = newNode
				node.prev = newNode
				if let newNode = extractNode(newNode) {
					newNode.next = .Node(node)
				}
			} else {
				push(value)
			}
		} else {
			append(value)
		}
	}
}

// MARK: - Pop
extension DoubleLinkedList {
	public mutating func pop() -> T? {
		if let head = extractNode(self) {
			self = head.next
			if let newHead = extractNode(self) {
				newHead.prev = .Nil
			}
			return head.value
		} else {
			return nil
		}
	}
}

// MARK: - Remove Last
extension DoubleLinkedList {
	public mutating func removeLast() -> T? {
		if !self.isEmpty {
			let listLength = self.listLength()
			guard let tail = node(at: listLength - 1) else {
				return nil
			}
			if let newTail = extractNode(tail.prev) {
				newTail.next = .Nil
			} else {
				self = .Nil
			}
			return tail.value
		} else {
			return nil
		}
	}
}

// MARK: - Remove at
extension DoubleLinkedList {
	public mutating func remove(at index:UInt) -> T? {
		if !self.isEmpty {
			guard let node = node(at: index) else {
				return nil
			}
			if let prev = extractNode(node.prev),
				let next = extractNode(node.next) {
				prev.next = node.next
				next.prev = node.prev
			} else if extractNode(node.prev) != nil {
				return removeLast()
			} else {
				return pop()
			}
			return node.value
		} else {
			return nil
		}
	}
}

// MARK: - Value at
extension DoubleLinkedList {
	public func value(at index: UInt) -> T? {
		return node(at:index)?.value
	}
}

// Data for cell
extension DoubleLinkedList where T == String {
	public func dataTuple(_ node: ListNode) -> (T, T, T) {
		var result = (prev:"", value:"", next:"")
		result.value = "Value: \(node.value)"
		result.prev = "Prev: \(extractNode(node.prev)?.value ?? "nil")"
		result.next = "Next: \(extractNode(node.next)?.value ?? "nil")"
		return result
	}
}