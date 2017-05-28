//
//  Queue.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

struct Queue<Element>: LinkedListInitializable {
    
    internal var list = LinkedList<Element>()
    
}

// MARK: Public Helper Values
extension Queue: LinkedListDerivative { }

// MARK: Remove All
extension Queue {
    
    public mutating func removeAll() {
        list.removeAll()
    }
    
}

// MARK: Convenience Modifiers
extension Queue {
    
    public mutating func pushBack(item: Element) {
        list.pushBack(item: item)
    }
    
    @discardableResult
    public mutating func popFront() -> Element? {
        return list.popFront()
    }
    
}

// MARK: Conversions
extension Queue {
    
    var arrayValue: [Element] {
        return list.arrayValue
    }
    
}

// MARK: Custom Strings
extension Queue: CustomStringConvertible {
    
    var description: String {
        return list.description
    }
    
}
