//
//  LinkedListInitializable.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

/// Allows conforming objects to be initialized with a `LinkedList`.
protocol LinkedListInitializable: ExpressibleByArrayLiteral {
    associatedtype Element
    
    /// Base list underlying the data structure
    var list: LinkedList<Element> { get set }
    
    init()
    
    /// Initialize the item using a LinkedList.
    ///
    /// - Parameter list: List to act as the base of the structure.
    init(list: LinkedList<Element>)
    
}

extension LinkedListInitializable {
    
    /// Initialize using an array of elements
    ///
    /// - Parameter array: Constituant array of elements
    init(array: [Element]) {
        self.init()
        list = LinkedList(array: array)
    }
    
    public init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }
    
}
