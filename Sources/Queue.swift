//
//  Queue.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

struct Queue<Element>: LinkedListInitializable {
    
    var base = LinkedList<Element>()
    
}

// MARK: Public Helper Values
extension Queue: LinkedListDerivative { }

// MARK: Remove All
extension Queue {
    
    public mutating func removeAll() {
        base.removeAll()
    }
    
}

// MARK: Convenience Modifiers
extension Queue {
    
    public mutating func pushBack(item: Element) {
        base.pushBack(item: item)
    }
    
    @discardableResult
    public mutating func popFront() -> Element? {
        return base.popFront()
    }
    
}

// MARK: Conversions
extension Queue {
    
    var arrayValue: [Element] {
        return base.arrayValue
    }
    
}

// MARK: Custom Strings
extension Queue: CustomStringConvertible {
    
    var description: String {
        return base.description
    }
    
}
