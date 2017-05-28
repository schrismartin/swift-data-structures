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
    
    var base: LinkedList<Element> { get set }
    
    var first: Node<Element>? { get }
    var last: Node<Element>? { get }
    var isEmpty: Bool { get }
    var count: Int { get }
}

extension LinkedListDerivative {
    
    internal var first: Node<Element>? {
        return base.first
    }
    
    internal var last: Node<Element>? {
        return base.last
    }
    
    public var isEmpty: Bool {
        return base.isEmpty
    }
    
    public var count: Int {
        return base.count
    }
    
}
