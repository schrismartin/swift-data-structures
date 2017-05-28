//
//  Dequeue.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

struct Dequeue<Element>: LinkedListInitializable {
    
    internal var list = LinkedList<Element>()
    
}

// MARK: Public Helper Values
extension Dequeue: LinkedListDerivative { }

// MARK: Remove All
extension Dequeue {
    
    public mutating func removeAll() {
        list.removeAll()
    }

}

// MARK: Convenience Modifiers
extension Dequeue {
    
    public mutating func pushBack(item: Element) {
        list.pushBack(item: item)
    }
    
    public mutating func pushFront(item: Element) {
        list.pushFront(item: item)
    }
    
    @discardableResult
    public mutating func popBack() -> Element? {
        return list.popBack()
    }
    
    @discardableResult
    public mutating func popFront() -> Element? {
        return list.popFront()
    }
    
}

// MARK: Conversions
extension Dequeue {
    
    var arrayValue: [Element] {
        return list.arrayValue
    }
    
}

// MARK: Custom Strings
extension Dequeue: CustomStringConvertible {
    
    var description: String {
        return list.description
    }
    
}
