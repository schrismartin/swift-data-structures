//
//  Dequeue.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

/// Linked list data structure where items must be added and removed
/// from the front and back, but no insertion in the middle can be
/// performed.
public struct Dequeue<Element>: LinkedListInitializable {
    
    internal var list = LinkedList<Element>()
    
}

// MARK: Convenience Modifiers
extension Dequeue: LinkedListDerivative {
    
    /// Add an item to the back of the dequeue.
    ///
    /// - Parameter item: Element to be added.
    public mutating func pushBack(item: Element) {
        list.pushBack(item: item)
    }
    
    /// Add an item to the front of the dequeue.
    ///
    /// - Parameter item: Element to be added.
    public mutating func pushFront(item: Element) {
        list.pushFront(item: item)
    }
    
    /// Remove an item from the back of the dequeue.
    ///
    /// - Returns: Element removed.
    @discardableResult
    public mutating func popBack() -> Element? {
        return list.popBack()
    }
    
    /// Remove an item from the front of the dequeue.
    ///
    /// - Returns: Element removed.
    @discardableResult
    public mutating func popFront() -> Element? {
        return list.popFront()
    }
    
}

// MARK: Custom Strings
extension Dequeue: CustomStringConvertible {
    
    public var description: String {
        return list.description
    }
    
}
