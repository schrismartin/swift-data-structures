//
//  ContainsLinkedListMetadata.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

/// Protocol containing common methods shared by all derivatives of Linked Lists.
protocol LinkedListDerivative {
    associatedtype Element
    
    /// Base list underlying the data structure
    var list: LinkedList<Element> { get set }
    
    var first: Node<Element>? { get }
    
    var last: Node<Element>? { get }
    
    var isEmpty: Bool { get }
    
    var count: Int { get }
    
    var arrayValue: [Element] { get }
    
    mutating func removeAll()
}

extension LinkedListDerivative {
    
    /// First node in the structure.
    internal var first: Node<Element>? {
        return list.first
    }
    
    /// Final node in the structure.
    internal var last: Node<Element>? {
        return list.last
    }
    
    /// Whether the linked list is empty.
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    /// Number of elements in the structure.
    public var count: Int {
        return list.count
    }
    
    /// Array variant of the queue.
    public var arrayValue: [Element] {
        return list.arrayValue
    }
    
    /// Remove all elements in the structure.
    public mutating func removeAll() {
        list.removeAll()
    }
    
}
