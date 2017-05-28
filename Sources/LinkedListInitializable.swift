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
    
    var list: LinkedList<Element> { get set }
    
    init()
    
    init(list: LinkedList<Element>)
    
}

extension LinkedListInitializable {
    
    init(array: [Element]) {
        self.init()
        list = LinkedList(array: array)
    }
    
    init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }
    
}
