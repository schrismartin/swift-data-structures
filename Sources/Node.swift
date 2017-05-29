//
//  Node.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/20/17.
//
//

import Foundation

/// Node contaning an element to a linked list data structure.
public final class Node<Element>: CustomStringConvertible {
    
    internal var next: Node<Element>?
    internal weak var previous: Node<Element>?
    
    /// Value of the element contained within the node.
    public var value: Element
    
    internal var isFirst: Bool {
        return previous == nil
    }
    
    internal var isLast: Bool {
        return next == nil
    }
    
    /// Create a new node containing the given value
    ///
    /// - Parameter value: Value to be assigned to the container node.
    internal init(value: Element) {
        self.value = value
    }
    
    internal func markForRemoval() {
        // Bookkeeping
        next?.previous = previous
        previous?.next = next
    }
    
    public var description: String {
        return String(describing: value)
    }
}
