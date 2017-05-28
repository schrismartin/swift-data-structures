//
//  Dequeue.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

struct Dequeue<Element>: ExpressibleByArrayLiteral {
    
    var base = LinkedList<Element>()
    
    init(array: [Element]) {
        base = LinkedList(array: array)
    }
    
    init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }
    
}

// MARK: Public Helper Values
extension Dequeue: LinkedListDerivative { }

// MARK: Remove All
extension Dequeue {
    
    public mutating func removeAll() {
        base.removeAll()
    }

}

// MARK: Convenience Modifiers
extension Dequeue {
    
    public mutating func pushBack(item: Element) {
        base.pushBack(item: item)
    }
    
    public mutating func pushFront(item: Element) {
        base.pushFront(item: item)
    }
    
    @discardableResult
    public mutating func popBack() -> Element? {
        return base.popBack()
    }
    
    @discardableResult
    public mutating func popFront() -> Element? {
        return base.popFront()
    }
    
}

// MARK: Conversions
extension Dequeue {
    
    var arrayValue: [Element] {
        return base.arrayValue
    }
    
}

// MARK: Custom Strings
extension Dequeue: CustomStringConvertible {
    
    var description: String {
        return base.description
    }
    
}
