//
//  ContainsLinkedListMetadata.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import Foundation

protocol LinkedListDerivative {
    associatedtype Element
    
    var list: LinkedList<Element> { get set }
    
    var first: Node<Element>? { get }
    var last: Node<Element>? { get }
    var isEmpty: Bool { get }
    var count: Int { get }
}

extension LinkedListDerivative {
    
    internal var first: Node<Element>? {
        return list.first
    }
    
    internal var last: Node<Element>? {
        return list.last
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var count: Int {
        return list.count
    }
    
}
