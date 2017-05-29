//
//  LinkedList.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/20/17.
//
//

import Foundation


/// A disjoint-memory data structure.
///
/// Allows for O(1) insertions and deletions
public struct LinkedList<Element>: ExpressibleByArrayLiteral {
    
    /// First node in the list
    fileprivate(set) public var first: Node<Element>?
    
    /// Final node in the list
    fileprivate(set) public var last: Node<Element>?
    
    /// Number of elements in the list
    fileprivate(set) public var count: Int = 0
    
    /// Initialize using an array of elements
    ///
    /// - Parameter array: Constituant array of elements
    public init(array: [Element]) {
        array.forEach { pushBack(item: $0) }
    }
    
    public init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }
    
}

// MARK: Public Helper Values
extension LinkedList {
    
    /// Whether the linked list is empty.
    public var isEmpty: Bool {
        return count == 0
    }
    
}

// MARK: Accessors
extension LinkedList {
    
    /// Get the element residing at an index. Runs in O(n) time.
    ///
    /// - Parameter index: Index of access.
    public subscript (_ index: Int) -> Node<Element>? {
        return node(at: index)
    }
    
    /// Get the element residing at an index. Runs in O(n) time.
    ///
    /// - Parameter index: Index of access.
    /// - Returns: Element at the index.
    public func node(at index: Int) -> Node<Element>? {
        let range = 0 ..< count
        guard range.contains(index) else { return nil }
        
        var node = first
        for _ in 0 ..< index {
            // If we've reached a nil node, exit early
            node = node?.next
        }
        
        return node
    }
    
    /// Get the node in the list after a given node.
    ///
    /// - Parameter node: Base node
    /// - Returns: Node after the base node, nil if base node is the last in
    ///            the list.

    public func node(after node: Node<Element>) -> Node<Element>? {
        return node.next
    }
    
    /// Get the node in the list before a given node.
    ///
    /// - Parameter node: Base node
    /// - Returns: Node before the base node, nil if base node is the first in
    ///            the list.
    public func node(before node: Node<Element>) -> Node<Element>? {
        return node.previous
    }
    
}

// MARK: Insertion and Removal
extension LinkedList {
    
    /// Removes all elements in the list.
    public mutating func removeAll() {
        first = nil
        last = nil
        count = 0
    }
    
    fileprivate mutating func insertFirst(value: Element) -> Node<Element> {
        let node = Node(value: value)
        
        first = node
        last = node
        count = 1
        
        return node
    }
    
    /// Insert an element after another node.
    ///
    /// - Parameters:
    ///   - value: Value to be inserted.
    ///   - previous: Node before the desired location of the inserted element.
    /// - Returns: Node containing the element.
    @discardableResult
    public mutating func insert(value: Element, after previous: Node<Element>) -> Node<Element> {
        let node = Node(value: value)
        
        if previous.isLast {
            last = node
        }
        
        previous.next?.previous = node
        node.next = previous.next
        
        previous.next = node
        node.previous = previous
        
        count += 1
        
        return node
    }
    
    /// Insert an element before another node
    ///
    /// - Parameters:
    ///   - value: Value to be inserted.
    ///   - next: Node after the desired location of the inserted element.
    /// - Returns: Node containing the element.
    @discardableResult
    public mutating func insert(value: Element, before next: Node<Element>) -> Node<Element> {
        let node = Node(value: value)
        
        if next.isFirst {
            first = node
        }
        
        next.previous?.next = node
        node.previous = next.previous
        
        next.previous = node
        node.next = next
        
        count += 1
        
        return node
    }
    
    /// Remove a node from the list.
    ///
    /// - Parameter node: Node to delete.
    /// - Returns: Element contained in the node.
    @discardableResult
    public mutating func remove(node: Node<Element>) -> Element {
        if node.isFirst {
            first = node.next
        }
        
        if node.isLast {
            last = node.previous
        }
        
        count -= 1
        
        node.markForRemoval()
        
        return node.value
    }
}

// MARK: Convenience Modifiers
extension LinkedList {
    
    /// Add a node containing the given element to the back of the list.
    ///
    /// - Parameter item: Element to be added.
    /// - Returns: Node containing the element.
    @discardableResult
    public mutating func pushBack(item: Element) -> Node<Element> {
        guard let last = last else { return insertFirst(value: item) }
        return insert(value: item, after: last)
    }
    
    /// Add a node containing the given element to the front of the list.
    ///
    /// - Parameter item: Element to be added.
    /// - Returns: Node containing the element.
    @discardableResult
    public mutating func pushFront(item: Element) -> Node<Element> {
        guard let first = first else { return insertFirst(value: item) }
        return insert(value: item, before: first)
    }
    
    /// Remove a node from the back of the list.
    ///
    /// - Returns: Element contained in the node.
    @discardableResult
    public mutating func popBack() -> Element? {
        guard let lastNode = last else { return nil }
        return remove(node: lastNode)
    }
    
    /// Remove a node from the front of the list.
    ///
    /// - Returns: Element contained in the mode.
    @discardableResult
    public mutating func popFront() -> Element? {
        guard let firstNode = first else { return nil }
        return remove(node: firstNode)
    }
    
}

// MARK: Conversions
extension LinkedList {
    
    /// Array variant of the linked list.
    public var arrayValue: [Element] {
        var array = [Element]()
        
        var node = first
        while let current = node {
            array.append(current.value)
            node = current.next
        }
        
        return array
    }
    
}

// MARK: Custom Strings
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = "["
        var node = first
        while let current = node {
            string += (current.description + (!current.isLast ? ", " : ""))
            node = current.next
        }
        string += "]"
        
        return string
    }
    
}
