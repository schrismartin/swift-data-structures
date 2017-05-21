import Foundation

struct LinkedList<Element>: ExpressibleByArrayLiteral {
    
    fileprivate(set) public var first: Node<Element>?
    fileprivate(set) public var last: Node<Element>?
    
    fileprivate(set) public var count: Int = 0
        
    init(array: [Element]) {
        array.forEach { pushBack(item: $0) }
    }
    
    init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }
    
}

// MARK: Public Helper Values
extension LinkedList {
    
    public var isEmpty: Bool {
        return count == 0
    }
    
}

// MARK: Accessors
extension LinkedList {
    
    subscript (_ index: Int) -> Node<Element>? {
        return node(at: index)
    }
    
    func node(at index: Int) -> Node<Element>? {
        let range = 0 ..< count
        guard range.contains(index) else { return nil }
        
        var node = first
        for _ in 0 ..< index {
            // If we've reached a nil node, exit early
            node = node?.next
        }
        
        return node
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
        guard let lastNode = last else { return nil }
        return remove(node: lastNode)
    }
    
    @discardableResult
    public mutating func popFront() -> Element? {
        guard let firstNode = first else { return nil }
        return remove(node: firstNode)
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
