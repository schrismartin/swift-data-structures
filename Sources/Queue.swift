//
//  Queue.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

/// Linked list data structure where items must be added from the back 
/// and removed from the front, but no insertion in the middle can be
/// performed.
public struct Queue<Element>: LinkedListInitializable {
    
    internal var list = LinkedList<Element>()
    
}

// MARK: Convenience Modifiers
extension Queue: LinkedListDerivative {
    
    /// Add an item to the back of the queue.
    ///
    /// - Parameter item: Element to be added.
    public mutating func pushBack(item: Element) {
        list.pushBack(item: item)
    }
    
    /// Remove an item from the front of the queue.
    ///
    /// - Returns: Element removed.
    @discardableResult
    public mutating func popFront() -> Element? {
        return list.popFront()
    }
    
}

// MARK: Custom Strings
extension Queue: CustomStringConvertible {
    
    public var description: String {
        return list.description
    }
    
}
