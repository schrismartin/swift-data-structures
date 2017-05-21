//
//  Node.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/20/17.
//
//

import Foundation

public final class Node<Element>: CustomStringConvertible {
    
    internal var next: Node<Element>?
    internal weak var previous: Node<Element>?
    
    public var value: Element
    
    internal var isFirst: Bool {
        return previous == nil
    }
    
    internal var isLast: Bool {
        return next == nil
    }
    
    init(value: Element) {
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
