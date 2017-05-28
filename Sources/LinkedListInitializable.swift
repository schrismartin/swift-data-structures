//
//  LinkedListInitializable.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

protocol LinkedListInitializable: ExpressibleByArrayLiteral {
    associatedtype Element
    
    var base: LinkedList<Element> { get set }
    
    init(list: LinkedList<Element>)
    
    init()
    
}

extension LinkedListInitializable {
    
    init(list: LinkedList<Element>) {
        self.init(array: list.arrayValue)
    }
    
    init(array: [Element]) {
        self.init()
        base = LinkedList(array: array)
    }
    
    init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }
    
}
