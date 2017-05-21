import Foundation

struct LinkedList<Element> {
    
    public final class Node<Element>: CustomStringConvertible {
        
        fileprivate var next: Node<Element>?
        fileprivate weak var previous: Node<Element>?
        
        public var value: Element
        
        fileprivate var isFirst: Bool {
            return previous == nil
        }
        
        fileprivate var isLast: Bool {
            return next == nil
        }
        
        init(value: Element) {
            self.value = value
        }
        
        fileprivate func markForRemoval() {
            // Bookkeeping
            next?.previous = previous
            previous?.next = next
        }
        
        public var description: String {
            return String(describing: value)
        }
    }
    
    fileprivate(set) public var first: Node<Element>?
    fileprivate(set) public var last: Node<Element>?
    
    fileprivate(set) public var count: Int = 0
    
}

// MARK: Public Helper Values
extension LinkedList {
    
    public var isEmpty: Bool {
        return first == nil && last == nil
    }
    
}

// MARK: Accessors
extension LinkedList {
    
    subscript (_ index: Int) -> Node<Element>? {
        return node(at: index)
    }
    
    func node(at index: Int) -> Node<Element>? {
        return first
    }
    
    func node(after node: Node<Element>) -> Node<Element>? {
        return node.next
    }
    
    func node(before node: Node<Element>) -> Node<Element>? {
        return node.previous
    }
    
}

// MARK: Insertion and Removal
extension LinkedList {
    
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
    
    public mutating func remove(node: Node<Element>) {
        if node.isFirst {
            first = node.next
        }
        
        if node.isLast {
            last = node.previous
        }
        
        count -= 1
        
        node.markForRemoval()
    }
}

// MARK: Convenience Modifiers
extension LinkedList {
    
    @discardableResult
    public mutating func pushBack(item: Element) -> Node<Element> {
        guard let last = last else { return insertFirst(value: item) }
        return insert(value: item, after: last)
    }
    
    @discardableResult
    public mutating func pushFront(item: Element) -> Node<Element> {
        guard let first = first else { return insertFirst(value: item) }
        return insert(value: item, before: first)
    }
    
    @discardableResult
    public mutating func popBack() -> Element? {
        guard let node = last else { return nil }
        remove(node: node)
        
        return node.value
    }
    
    @discardableResult
    public mutating func popFront() -> Element? {
        guard let node = first else { return nil }
        remove(node: node)
        
        return node.value
    }
    
}

// MARK: Conversions
extension LinkedList {
    
    var arrayValue: [Element] {
        var array = [Element]()
        
        var node = first
        while let current = node {
            array.append(current.value)
            node = current.next
        }
        
        return array
    }
    
}

extension LinkedList: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        
        elements.forEach { pushBack(item: $0) }
        
    }
    
}

// MARK: Custom Strings
extension LinkedList: CustomStringConvertible {
    
    var description: String {
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
